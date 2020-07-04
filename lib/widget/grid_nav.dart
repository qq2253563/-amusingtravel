import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/home_model.dart';
import 'package:flutterapp/widget/webview.dart';

class GridNavView extends StatelessWidget {
  final GridNav gridNavModel;

  const GridNavView({Key key, @required this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child:  Column(
        children: _gridNavItems(context),
      ),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context, gridNavModel.flight, true));
    }
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel, true));
    }
    return items;
  }

  _gridNavItem(BuildContext context, Nav hotel, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, hotel.mainItem));
    items.add(_doubleItem(context, hotel.item1, hotel.item2));
    items.add(_doubleItem(context, hotel.item3, hotel.item4));
    List<Widget> expandItems = [];
    items.forEach((element) {
      expandItems.add(Expanded(child: element, flex: 1));
    });
    Color startColor = Color(int.parse('0xff' + hotel.startColor));
    Color endColor = Color(int.parse('0xff' + hotel.endColor));

    return Container(
      height: 88,
      margin: first ? null : const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          //线性渐变
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(
        children: expandItems,
      ),
    );
  }

  _mainItem(BuildContext context, Item item) {
    return _wrapGesture(
        context,
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image.network(
              item.icon,
              fit: BoxFit.contain,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: const EdgeInsets.only(top: 11),
              child:
                  Text(item.title, style: TextStyle(fontSize: 14, color: Colors.white)),
            )
          ],
        ),
        item);
  }

  _doubleItem(BuildContext context, Item topItem, Item bottomItem) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context, topItem, true),
        ),
        Expanded(
          child: _item(context, bottomItem, false),
        )
      ],
    );
  }

  _item(BuildContext context, Item item, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      //撑满父布局
      widthFactor: 1,
      child: Container(
          decoration: BoxDecoration(
              border: Border(
            left: borderSide,
            bottom: first ? borderSide : BorderSide.none,
          )),
          child: _wrapGesture(
              context,
              Center(
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              item)),
    );
  }

  _wrapGesture(BuildContext context, Widget widget, Item item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: item.url,
                      title: item.title,
                      statusBarColor: item.statusBarColor,
                      hideAppbar: item.hideAppBar,
                    )));
      },
      child: widget,
    );
  }
}
