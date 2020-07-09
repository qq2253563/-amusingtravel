import 'package:dio/dio.dart';
import 'package:flutterapp/model/travel_model.dart';
import 'package:flutterapp/model/travel_tab_model.dart';

var params = {
  "districtId": -1,
  "groupChannelCode": "tourphoto_global1",
  "type": null,
  "lat": 34.2317081,
  "lon": 108.928918,
  "locatedDistrictId": 7,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {
    "cid": "09031010211161114530",
    "ctok": "",
    "cver": "1.0",
    "lang": "01",
    "sid": "8888",
    "syscode": "09",
    "auth": null,
    "extension": [
      {"name": "protocal", "value": "https"}
    ]
  },
  "contentType": "json"
};

class TravelDao {
  static Future<TravelTabModel> tabFetch() async {
    final response = await Dio()
        .get("http://www.devio.org/io/flutter_app/json/travel_page.json");
    if (response.statusCode == 200) {
      return TravelTabModel.fromJson(response.data);
    } else {
      throw Exception('http fail load travel_page');
    }
  }

  static Future<TravelModel> fetch(int page, String groupChannelCode) async {
    Map paramsMap = params['pagePara'];
    paramsMap['pageIndex'] = page;
    params['groupChannelCode'] = groupChannelCode;
    final response = await Dio().post(
        "https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5",
        data: params);
    print(response.data);
    if (response.statusCode == 200) {
      return TravelModel.fromJson(response.data);
    } else {
      throw Exception('http fail load travel_page');
    }
  }
}
