import 'package:flutter/material.dart';
import 'package:flutterapp/dao/travel_dao.dart';
import 'package:flutterapp/model/travel_tab_model.dart';
import 'package:flutterapp/pages/travel_page.dart';

class TravelTab extends StatefulWidget{

  @override
  _TravelTabTabState createState() => _TravelTabTabState();
}

class _TravelTabTabState extends State<TravelTab> with TickerProviderStateMixin{
  TabController _controller;
  List<TabModel> tabs = [];

  @override
  void initState() {
    _controller = TabController(length: 0,vsync: this);
    TravelDao.tabFetch().then((model){
      _controller = TabController(length: model.tabs.length,vsync: this);
      setState(() {
        tabs = model.tabs;
      });
    }).catchError((e){
      print(e);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 30),
            child: TabBar(
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.black,
              labelPadding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xff2fcfbb),width: 3),
                insets: const EdgeInsets.only(bottom: 10)
              ),
              tabs: _itemBar(),
            ),
          ),
          Flexible(
            child:TabBarView(
              controller: _controller,
              children: tabs.map((e){
                return TravelPage(groupChannelCode: e.groupChannelCode,);
              }).toList(),
            )
          ),
        ],
      ),
   );
  }

  _itemBar() {
    return tabs.map<Tab>((tab){
      return Tab(text: tab.labelName,);
    }).toList();
  }

}