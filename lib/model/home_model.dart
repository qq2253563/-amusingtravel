class HomeModel {
    List<Item> bannerList;
    Config config;
    GridNav gridNav;
    List<Item> localNavList;
    SalesBox salesBox;
    List<Item> subNavList;

    HomeModel({this.bannerList, this.config, this.gridNav, this.localNavList, this.salesBox, this.subNavList});

    factory HomeModel.fromJson(Map<String, dynamic> json) {
        return HomeModel( 
            bannerList: json['bannerList'] != null ? (json['bannerList'] as List).map((i) => Item.fromJson(i)).toList() : null,
            config: json['config'] != null ? Config.fromJson(json['config']) : null,
            gridNav: json['gridNav'] != null ? GridNav.fromJson(json['gridNav']) : null,
            localNavList: json['localNavList'] != null ? (json['localNavList'] as List).map((i) => Item.fromJson(i)).toList() : null,
            salesBox: json['salesBox'] != null ? SalesBox.fromJson(json['salesBox']) : null,
            subNavList: json['subNavList'] != null ? (json['subNavList'] as List).map((i) => Item.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.bannerList != null) {
            data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
        }
        if (this.config != null) {
            data['config'] = this.config.toJson();
        }
        if (this.gridNav != null) {
            data['gridNav'] = this.gridNav.toJson();
        }
        if (this.localNavList != null) {
            data['localNavList'] = this.localNavList.map((v) => v.toJson()).toList();
        }
        if (this.salesBox != null) {
            data['salesBox'] = this.salesBox.toJson();
        }
        if (this.subNavList != null) {
            data['subNavList'] = this.subNavList.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class GridNav {
    Nav flight;
    Nav hotel;
    Nav travel;

    GridNav({this.flight, this.hotel, this.travel});

    factory GridNav.fromJson(Map<String, dynamic> json) {
        return GridNav(
            flight: json['flight'] != null ? Nav.fromJson(json['flight']) : null,
            hotel: json['hotel'] != null ? Nav.fromJson(json['hotel']) : null,
            travel: json['travel'] != null ? Nav.fromJson(json['travel']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.flight != null) {
            data['flight'] = this.flight.toJson();
        }
        if (this.hotel != null) {
            data['hotel'] = this.hotel.toJson();
        }
        if (this.travel != null) {
            data['travel'] = this.travel.toJson();
        }
        return data;
    }
}

class Nav {
    String endColor;
    Item item1;
    Item item2;
    Item item3;
    Item item4;
    Item mainItem;
    String startColor;

    Nav({this.endColor, this.item1, this.item2, this.item3, this.item4, this.mainItem, this.startColor});

    factory Nav.fromJson(Map<String, dynamic> json) {
        return Nav(
            endColor: json['endColor'],
            item1: json['item1'] != null ? Item.fromJson(json['item1']) : null,
            item2: json['item2'] != null ? Item.fromJson(json['item2']) : null,
            item3: json['item3'] != null ? Item.fromJson(json['item3']) : null,
            item4: json['item4'] != null ? Item.fromJson(json['item4']) : null,
            mainItem: json['mainItem'] != null ? Item.fromJson(json['mainItem']) : null,
            startColor: json['startColor'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['endColor'] = this.endColor;
        data['startColor'] = this.startColor;
        if (this.item1 != null) {
            data['item1'] = this.item1.toJson();
        }
        if (this.item2 != null) {
            data['item2'] = this.item2.toJson();
        }
        if (this.item3 != null) {
            data['item3'] = this.item3.toJson();
        }
        if (this.item4 != null) {
            data['item4'] = this.item4.toJson();
        }
        if (this.mainItem != null) {
            data['mainItem'] = this.mainItem.toJson();
        }
        return data;
    }
}

class Item {
    bool hideAppBar;
    String icon;
    String statusBarColor;
    String title;
    String url;

    Item({this.hideAppBar, this.icon, this.statusBarColor, this.title, this.url});

    factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
            hideAppBar: json['hideAppBar'],
            icon: json['icon'],
            statusBarColor: json['statusBarColor'],
            title: json['title'],
            url: json['url'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['hideAppBar'] = this.hideAppBar;
        data['icon'] = this.icon;
        data['statusBarColor'] = this.statusBarColor;
        data['title'] = this.title;
        data['url'] = this.url;
        return data;
    }
}

class SalesBox {
    Item bigCard1;
    Item bigCard2;
    String icon;
    String moreUrl;
    Item smallCard1;
    Item smallCard2;
    Item smallCard3;
    Item smallCard4;

    SalesBox({this.bigCard1, this.bigCard2, this.icon, this.moreUrl, this.smallCard1, this.smallCard2, this.smallCard3, this.smallCard4});

    factory SalesBox.fromJson(Map<String, dynamic> json) {
        return SalesBox(
            bigCard1: json['bigCard1'] != null ? Item.fromJson(json['bigCard1']) : null,
            bigCard2: json['bigCard2'] != null ? Item.fromJson(json['bigCard2']) : null,
            icon: json['icon'],
            moreUrl: json['moreUrl'],
            smallCard1: json['smallCard1'] != null ? Item.fromJson(json['smallCard1']) : null,
            smallCard2: json['smallCard2'] != null ? Item.fromJson(json['smallCard2']) : null,
            smallCard3: json['smallCard3'] != null ? Item.fromJson(json['smallCard3']) : null,
            smallCard4: json['smallCard4'] != null ? Item.fromJson(json['smallCard4']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['icon'] = this.icon;
        data['moreUrl'] = this.moreUrl;
        if (this.bigCard1 != null) {
            data['bigCard1'] = this.bigCard1.toJson();
        }
        if (this.bigCard2 != null) {
            data['bigCard2'] = this.bigCard2.toJson();
        }
        if (this.smallCard1 != null) {
            data['smallCard1'] = this.smallCard1.toJson();
        }
        if (this.smallCard2 != null) {
            data['smallCard2'] = this.smallCard2.toJson();
        }
        if (this.smallCard3 != null) {
            data['smallCard3'] = this.smallCard3.toJson();
        }
        if (this.smallCard4 != null) {
            data['smallCard4'] = this.smallCard4.toJson();
        }
        return data;
    }
}

class Config {
    String searchUrl;

    Config({this.searchUrl});

    factory Config.fromJson(Map<String, dynamic> json) {
        return Config(
            searchUrl: json['searchUrl'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['searchUrl'] = this.searchUrl;
        return data;
    }
}