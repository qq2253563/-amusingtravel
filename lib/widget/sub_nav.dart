import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/widget/webview.dart';

class SubNavView extends StatefulWidget {
  final List<Item> subNavList;

  const SubNavView({Key key, @required this.subNavList}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SubNavState();
}

class SubNavState extends State<SubNavView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (widget.subNavList == null) return null;
    List<Widget> items = [];
    widget.subNavList
        .forEach((localNav) => {items.add(_item(context, localNav))});
    //计算每行显示数量
    int separate = (widget.subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(0, separate)),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.sublist(separate, widget.subNavList.length)),
        )
      ],
    );
  }

  Widget _item(BuildContext context, Item localNav) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebView(
                    url: localNav.url,
                    title: localNav.title,
                    statusBarColor: localNav.statusBarColor,
                    hideAppbar: localNav.hideAppBar,
                  )));
        },
        child: Column(
          children: <Widget>[
            Image.network(
              localNav.icon,
              width: 18,
              height: 18,
            ),
            Text(
              localNav.title,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
