import 'package:dio/dio.dart';
import 'package:flutterapp/model/search_model.dart';

class SearchDao {
  static Future<SearchModel> fetch(String keyword) async {
    final response = await Dio().get(
        "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=$keyword");
    SearchModel searchModel = SearchModel.fromJson(response.data);
    searchModel.keyword = keyword;
    return searchModel;
  }
}
