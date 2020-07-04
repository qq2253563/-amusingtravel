import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//添加进度条组建
class LoadingContainer extends StatelessWidget{

  final Widget child;
  final bool isLoading;
  final bool cover;

  const LoadingContainer({Key key, this.isLoading, this.cover, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover ?! isLoading ? child : _loadingView : Stack(
      children: <Widget>[child,isLoading?_loadingView:null],
    );
  }

  Widget get _loadingView{
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}