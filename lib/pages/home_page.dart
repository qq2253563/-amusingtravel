import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/dao/home_dao.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/pages/search_page.dart';
import 'package:flutterapp/pages/speak_page.dart';
import 'package:flutterapp/widget/grid_nav.dart';
import 'package:flutterapp/widget/local_nav.dart';
import 'package:flutterapp/widget/sales_box.dart';
import 'package:flutterapp/widget/search_bar.dart';
import 'package:flutterapp/widget/sub_nav.dart';
import 'package:flutterapp/widget/webview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> _imageUrls = [];
  List<Item> _localNavList = [];
  GridNav _gridNav;
  List<Item> _subNavList = [];
  SalesBox _salesBox;

  double appbarAlpha = 0;

  @override
  void initState() {
    super.initState();
    _handlerRefresh();
  }


  Future<Null> _handlerRefresh() async {
    try {
      HomeModel homeModel = await HomeDao.fetch();
      setState(() {
        _localNavList = homeModel.localNavList;
        _gridNav = homeModel.gridNav;
        _subNavList = homeModel.subNavList;
        _salesBox = homeModel.salesBox;
        _imageUrls = homeModel.bannerList;
      });
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: RefreshIndicator(
                  onRefresh: _handlerRefresh,
                  child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    _scroll(scrollNotification.metrics.pixels);
                  }
                  return false;
                },
                child: _listView,
              )),
            ),
            _appBar
          ],
        ));
  }

  void _scroll(offset) {
    double alpha = offset / 50;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appbarAlpha = alpha;
    });
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: LocalNavView(
            localNavList: _localNavList,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: GridNavView(gridNavModel: _gridNav),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SubNavView(
            subNavList: _subNavList,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SalesBoxView(
            salesBox: _salesBox,
          ),
        )
      ],
    );
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000),Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            height: 80.0,
            decoration: BoxDecoration(
              color: Color.fromARGB((appbarAlpha * 255).toInt(),255,255,255)
            ),
            child: SearchBarView(
              searchBarType: appbarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: '网红打卡地 景点 酒店 美食',
              leftButtonClick: (){ },
            ),
          ),
        )
      ],
    );
  }

  Widget get _banner {
    return Container(
      height: 180,
      child: Swiper(
        containerHeight: 180.0,
        itemCount: _imageUrls.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebView(
                        url: _imageUrls[index].url,
                        title: _imageUrls[index].title,
                        hideAppbar: _imageUrls[index].hideAppBar,
                      )));
            },
            child: Image.network(
              _imageUrls[index].icon,
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }

  _jumpToSearch() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => SearchPage(hint: '网红打卡地 景点 酒店 美食',)
    ));
  }

  _jumpToSpeak() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => SpeakPage()
    ));
  }
}
