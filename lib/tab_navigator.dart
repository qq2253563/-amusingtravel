import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/pages/my_page.dart';
import 'package:flutterapp/pages/search_page.dart';
import 'package:flutterapp/pages/travel_page.dart';


class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _contorller = PageController(
    initialPage: 0,
  );
  final _defaultColor = Colors.grey;
  final _selectColor = Colors.blue;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _contorller,
        children: <Widget>[
          HomePage(),
          SearchPage(hideLeft: true,),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _contorller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _defaultColor,),
              activeIcon: Icon(Icons.home, color: _selectColor,),
            title: Text('首页',
              style: TextStyle(color: _currentIndex!=0?_defaultColor:_selectColor),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _defaultColor,),
              activeIcon: Icon(Icons.search, color: _selectColor,),
              title: Text('搜索',
                style: TextStyle(color: _currentIndex!=1?_defaultColor:_selectColor),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, color: _defaultColor,),
              activeIcon: Icon(Icons.camera, color: _selectColor,),
              title: Text('旅拍',
                style: TextStyle(color: _currentIndex!=2?_defaultColor:_selectColor),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _defaultColor,),
              activeIcon: Icon(Icons.account_circle, color: _selectColor,),
              title: Text('我的',
                style: TextStyle(color: _currentIndex!=3?_defaultColor:_selectColor),)
          ),
        ],
      ),
    );
  }
}
