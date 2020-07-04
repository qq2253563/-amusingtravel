import 'package:dio/dio.dart';
import 'package:flutterapp/model/home_model.dart';

class HomeDao{
  static Future<HomeModel> fetch() async{
    final response = await Dio().get("https://www.devio.org/io/flutter_app/json/home_page.json");
    return HomeModel.fromJson(response.data);
  }
}