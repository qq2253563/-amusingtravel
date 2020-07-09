import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapp/dao/travel_dao.dart';
import 'package:flutterapp/model/travel_model.dart';
import 'package:flutterapp/widget/load_container.dart';
import 'package:flutterapp/widget/webview.dart';

class TravelPage extends StatefulWidget {
  final String groupChannelCode;

  const TravelPage({Key key, @required this.groupChannelCode})
      : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage>
    with AutomaticKeepAliveClientMixin {
  List<Result> data = [];
  int page = 1;
  bool _isLoad = true;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _handlerRefresh();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadingContainer(
      cover: false,
      isLoading: _isLoad,
      child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: RefreshIndicator(
            onRefresh: _handlerRefresh,
            child: StaggeredGridView.countBuilder(
              controller: _scrollController,
              crossAxisCount: 2,
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) => _Item(
                itemResult: data[index],
                index: index,
              ),
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ),
          )),
    ));
  }

  Future<Null> _handlerRefresh() async {
    page = 1;
    _loadData();
  }

  _loadData() async {
    _isLoad = true;
    try {
      TravelModel travelModel =
          await TravelDao.fetch(page, widget.groupChannelCode);
      setState(() {
        page++;
        travelModel.resultList.forEach((element) {
          if (element.article != null) {
            data.add(element);
          }
        });
      });
    } catch (e) {
      print(e);
    } finally {
      _isLoad = false;
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _Item extends StatelessWidget {
  final Result itemResult;
  final int index;

  const _Item({Key key, this.itemResult, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<Url> url = itemResult.article.urls;
        if (url != null && url.isNotEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebView(
                        url: url[0].h5Url,
                        title: '详情',
                      )));
        }
      },
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _itemImage(),
              Container(
                padding: const EdgeInsets.all(4),
                child: Text(
                  itemResult.article.articleTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              _infoText()
            ],
          ),
        ),
      ),
    );
  }

  _itemImage() {
    return Stack(
      children: <Widget>[
        Image.network(itemResult.article.images[0]?.dynamicUrl),
        Positioned(
          bottom: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
                LimitedBox(
                  maxWidth: 130,
                  child: Text(
                    _poiName(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  String _poiName() {
    return itemResult.article.pois == null || itemResult.article.pois.isEmpty
        ? '未知'
        : itemResult.article.pois[0]?.poiName ?? '未知';
  }

  _infoText() {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PhysicalModel(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                itemResult.article.author?.coverImage?.dynamicUrl,
                width: 24,
                height: 24,
              )),
          Container(
            padding: const EdgeInsets.all(5),
            width: 90,
            child: Text(
              itemResult.article.author?.nickName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                size: 14,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  itemResult.article.likeCount.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
