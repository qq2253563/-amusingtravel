import 'package:dio/dio.dart';
import 'package:flutterapp/model/home_model.dart';

class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await Dio()
        .get("https://www.devio.org/io/flutter_app/json/home_page.json");
    if(response.statusCode == 200){
      return HomeModel.fromJson(response.data);
    }else{
      throw Exception('http fail load home_page');
    }
  }
}
