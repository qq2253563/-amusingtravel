import 'package:flutter/material.dart';
import 'package:flutterapp/pages/search_page.dart';
import 'package:flutterapp/plugin/AsrManager.dart';

//语音识别
class SpeakPage extends StatefulWidget {
  @override
  _SpeakPageState createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage>
    with SingleTickerProviderStateMixin {
  String hint = '长按说话';
  String speakResult = '';
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
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
        body: Container(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_topItem(), _bottomItem()],
        ),
      ),
    ));
  }

  _speakStart() async{
    _controller.forward();
    setState(() {
      hint = '- 识别中 -';
    });
    try{
       String value = await AsrManager.start();
       if(value != null&&value.length>0){
         setState(() {
           speakResult = value;
         });
         Navigator.pop(context);
         Navigator.push(context,MaterialPageRoute(builder: (context)=>
             SearchPage(keyword: speakResult,)
         ));
         print("------$speakResult--------");
       }
    }catch(e){
      print("------$e--------");
    }
  }

  _speakStop() {
    setState(() {
      hint = '长按说话';
    });
    _controller.reset();
    _controller.stop();
    AsrManager.stop();
  }

  _speakCancel() {
    setState(() {
      hint = '长按说话';
    });
    _controller.reset();
    _controller.stop();
    AsrManager.cancel();
  }

  _bottomItem() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: <Widget>[
          GestureDetector(
              onTapDown: (e) {
                _speakStart();
              },
              onTapUp: (e) {
                _speakStop();
              },
              onTapCancel: () {
                _speakCancel();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(hint,
                        style: TextStyle(color: Colors.blue, fontSize: 12)),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                      ),
                      Center(
                        child: AnimatedMic(
                          animation: _animation,
                        ),
                      )
                    ],
                  )
                ],
              )),
          Positioned(
            right: 0,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  _topItem() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          child: Text(
            '你可以这样说',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          '故宫门票\n北京一日游\n迪士尼乐园',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(speakResult,style: TextStyle(color: Colors.blue),),
        )
      ],
    );
  }
}

class AnimatedMic extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 1, end: 0.5);
  static final _sizeTween = Tween<double>(begin: 80, end: 60);

  AnimatedMic({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(40)),
        child: Icon(
          Icons.mic,
          color: Colors.white,
        ),
      ),
    );
  }
}
