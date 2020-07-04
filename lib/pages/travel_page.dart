import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget{

  @override
  _TravelPageState createState() => _TravelPageState();

}


class _TravelPageState extends State<TravelPage>{

  List CITY = ["北京","上海","广州","深圳","杭州","成都","武汉"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: _handlerRefresh,
          child:GridView.count(
      crossAxisCount: 2,
      children: _buildList(),
    )));
  }

  Future<Null> _handlerRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      CITY = CITY.reversed.toList();
    });
  }

  List<Widget> _buildList(){
    return CITY.map((e) => _item(e)).toList();
  }

  Widget _item(String e) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom:5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text(
        e,
        style: TextStyle(color: Colors.white,fontSize: 20),
      ),
    );
  }

}