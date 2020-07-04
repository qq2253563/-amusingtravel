import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/widget/webview.dart';
class LocalNavView extends StatefulWidget{

  final List<Item> localNavList;

  const LocalNavView({Key key, @required this.localNavList}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => LocalNavState();
}

class LocalNavState extends State<LocalNavView>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context){
    if(widget.localNavList == null) return null;
    List<Widget> items = [];
    widget.localNavList.forEach((localNav) => {
      items.add(_item(context, localNav))
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
    );
  }

  Widget _item(BuildContext context,Item localNav){
    return GestureDetector(
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
            width: 32,
            height: 32,
          ),
          Text(
            localNav.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

}
