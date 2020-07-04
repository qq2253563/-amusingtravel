import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
List CATCH_URLS = ['m.ctrip.com/','m.ctrip.com/html5','m.ctrip.com/html5/'];
class WebView extends StatefulWidget{

  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppbar;
  final bool backForbid;


  WebView({this.url,
    this.statusBarColor,
    this.title,
    this.hideAppbar,
    this.backForbid = false});

  @override
  State<StatefulWidget> createState() => _WebViewState();

}

class _WebViewState extends State<WebView>{

  final webViewReference = FlutterWebviewPlugin();

  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStatelChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting = false;
  @override
  void initState() {
    super.initState();
    webViewReference.close();
    _onUrlChanged = webViewReference.onUrlChanged.listen((url) {

    });
    _onStatelChanged = webViewReference.onStateChanged.listen((state) {
      switch(state.type){
        case WebViewState.shouldStart:
          if(_isToMain(state.url) && !exiting){
            if(widget.backForbid){
              webViewReference.launch(widget.url);
            }else{
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
    _onHttpError = webViewReference.onHttpError.listen((error) {
      print(error);
    });
  }

  _isToMain(String url){
    bool contain = false;
    for (var value in CATCH_URLS) {
      if(url?.endsWith(value)??false){
          contain = true;
          break;
      }
    }
    return contain;
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    _onStatelChanged.cancel();
    _onHttpError.cancel();
    webViewReference.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if(statusBarColorStr == 'ffffff'){
      backButtonColor = Colors.black;
    }else{
      backButtonColor = Colors.white;
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(int.parse('0xff'+statusBarColorStr)),backButtonColor),
          Expanded(
            child: WebviewScaffold(url: widget.url,
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Container(
                color: Colors.white,
                child: Center(
                  child: Text('Waiting...'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  _appBar(Color background,Color backButtonColor){
    if(widget.hideAppbar??false){
      return Container(
        color: backButtonColor,
        height: 30,

      );
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
      child: FractionallySizedBox(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left:16),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title??'',
                  style: TextStyle(color: backButtonColor,fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}