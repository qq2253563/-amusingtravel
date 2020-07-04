import 'package:flutter/material.dart';
import 'package:flutterapp/dao/search_dao.dart';
import 'package:flutterapp/model/search_model.dart';
import 'package:flutterapp/pages/speak_page.dart';
import 'package:flutterapp/widget/search_bar.dart';
import 'package:flutterapp/widget/webview.dart';

const TYPES = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];

class SearchPage extends StatefulWidget {
  final bool hideLeft;
  final String keyword;
  final String hint;

  const SearchPage({Key key, this.hideLeft, this.keyword, this.hint})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel _searchModel;
  String keyword;

  @override
  void initState() {
    if(widget.keyword != null){
      _onTextChange(widget.keyword);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _appBar(),
        MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: _searchModel?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int position) {
                    return _item(position);
                  }),
            ))
      ],
    ));
  }

  _onTextChange(String text) {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        _searchModel = null;
      });
      return;
    }
    _handlerSearch(keyword);
  }

  _handlerSearch(String text) async {
    try {
      SearchModel searchModel = await SearchDao.fetch(text);
      if (searchModel.keyword == text) {
        setState(() {
          _searchModel = searchModel;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: SearchBarView(
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint,
              speakClick: _jumpToSpeak,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChange: _onTextChange,
            ),
          ),
        )
      ],
    );
  }

  _item(int position) {
    if (_searchModel == null || _searchModel.data == null) return null;
    SearchItem item = _searchModel.data[position];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: item.url,
                      title: '详情',
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(1),
              child: Image(
                height: 26,
                width: 26,
                image: AssetImage(_typeImage(item.type)),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: _title(item),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 5),
                  child: _subTitle(item),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String _typeImage(String type) {
    if (type == null) return 'assets/images/type_travelgroup.png';
    String path = 'travelgroup';
    for (final val in TYPES) {
      if (type.contains(val)) {
        path = val;
        break;
      }
    }
    return 'assets/images/type_$path.png';
  }

  _title(SearchItem item) {
    if (item == null) return null;
    List<TextSpan> spans = [];
    spans.addAll(_keywordSpans(item.word, _searchModel.keyword));
    spans.add(TextSpan(
        text: '  ' + (item.districtname ?? '') + ' ' + (item.zonename ?? ''),
        style: TextStyle(fontSize: 16, color: Colors.grey)));
    return RichText(
      text: TextSpan(children: spans),
    );
  }

  _subTitle(SearchItem item) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: item.price ?? '',
            style: TextStyle(fontSize: 16,color: Colors.orange)
          ),
          TextSpan(
            text: ' '+(item.star ?? ''),
            style: TextStyle(fontSize: 12,color: Colors.grey)
          )
        ]
      ),
    );
  }

  Iterable<TextSpan> _keywordSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;
    List<String> arr = word.split(keyword);
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordlStyle = TextStyle(fontSize: 16, color: Colors.orange);
    for (int i = 0; i < arr.length; i++) {
      if ((i + 1) % 2 == 0) {
        spans.add(TextSpan(text: keyword, style: keywordlStyle));
      }
      String val = arr[i];
      if (val != null && val.length > 0) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }

  void _jumpToSpeak() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => SpeakPage()
    ));
  }
}
