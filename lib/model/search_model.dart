class SearchModel {
  List<SearchItem> data;
  String keyword;

  SearchModel({this.data,this.keyword});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List;
    List<SearchItem> list =
        dataJson.map((e) => SearchItem.fromJson(e)).toList();
    return SearchModel(data: list);
  }
}

class SearchItem {
  String code;
  String districtname;
  String price;
  String star;
  String type;
  String url;
  String word;
  String zonename;

  SearchItem(
      {this.code,
      this.districtname,
      this.price,
      this.star,
      this.type,
      this.url,
      this.word,
      this.zonename});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      code: json['code'],
      districtname: json['districtname'],
      price: json['price'],
      star: json['star'],
      type: json['type'],
      url: json['url'],
      word: json['word'],
      zonename: json['zonename'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['districtname'] = this.districtname;
    data['price'] = this.price;
    data['star'] = this.star;
    data['type'] = this.type;
    data['url'] = this.url;
    data['word'] = this.word;
    data['zonename'] = this.zonename;
    return data;
  }
}
