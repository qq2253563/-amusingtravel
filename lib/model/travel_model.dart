class TravelModel {
    List<Result> resultList;
    num totalCount;

    TravelModel({ this.resultList, this.totalCount});

    factory TravelModel.fromJson(Map<String, dynamic> json) {
        return TravelModel(
            resultList: json['resultList'] != null ? (json['resultList'] as List).map((i) => Result.fromJson(i)).toList() : null,
            totalCount: json['totalCount'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['totalCount'] = this.totalCount;
        if (this.resultList != null) {
            data['resultList'] = this.resultList.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Result {
    Article article;
    int type;

    Result({this.article, this.type});

    factory Result.fromJson(Map<String, dynamic> json) {
        return Result(
            article: json['article'] != null ? Article.fromJson(json['article']) : null, 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['type'] = this.type;
        if (this.article != null) {
            data['article'] = this.article.toJson();
        }
        return data;
    }
}

class Article {
    num articleId;
    num articleStatus;
    String articleTitle;
    Author author;
    num collectCount;
    num commentCount;
    String content;
    String currentDate;
    String distanceText;
    bool hasVideo;
    num imageCounts;
    List<ImageModel> images;
    bool isCollected;
    bool isLike;
    num level;
    num likeCount;
    String poiName;
    List<Poi> pois;
    num productType;
    String publishTime;
    String publishTimeDisplay;
    num readCount;
    num shareCount;
    ShareInfo shareInfo;
    String shootTime;
    String shootTimeDisplay;
    num sourceId;
    num sourceType;
    List<Tag> tags;
    List<Topic> topics;
    List<Url> urls;
    String videoAutoplayNet;

    Article({this.articleId, this.articleStatus, this.articleTitle, this.author, this.collectCount, this.commentCount, this.content, this.currentDate, this.distanceText, this.hasVideo, this.imageCounts, this.images, this.isCollected, this.isLike, this.level, this.likeCount, this.poiName, this.pois, this.productType, this.publishTime, this.publishTimeDisplay, this.readCount, this.shareCount, this.shareInfo, this.shootTime, this.shootTimeDisplay, this.sourceId, this.sourceType, this.tags, this.topics, this.urls, this.videoAutoplayNet});

    factory Article.fromJson(Map<String, dynamic> json) {
        return Article(
            articleId: json['articleId'], 
            articleStatus: json['articleStatus'], 
            articleTitle: json['articleTitle'], 
            author: json['author'] != null ? Author.fromJson(json['author']) : null, 
            collectCount: json['collectCount'], 
            commentCount: json['commentCount'], 
            content: json['content'], 
            currentDate: json['currentDate'], 
            distanceText: json['distanceText'], 
            hasVideo: json['hasVideo'], 
            imageCounts: json['imageCounts'], 
            images: json['images'] != null ? (json['images'] as List).map((i) => ImageModel.fromJson(i)).toList() : null, 
            isCollected: json['isCollected'], 
            isLike: json['isLike'], 
            level: json['level'], 
            likeCount: json['likeCount'], 
            poiName: json['poiName'], 
            pois: json['pois'] != null ? (json['pois'] as List).map((i) => Poi.fromJson(i)).toList() : null, 
            productType: json['productType'], 
            publishTime: json['publishTime'], 
            publishTimeDisplay: json['publishTimeDisplay'], 
            readCount: json['readCount'], 
            shareCount: json['shareCount'], 
            shareInfo: json['shareInfo'] != null ? ShareInfo.fromJson(json['shareInfo']) : null, 
            shootTime: json['shootTime'], 
            shootTimeDisplay: json['shootTimeDisplay'], 
            sourceId: json['sourceId'], 
            sourceType: json['sourceType'], 
            tags: json['tags'] != null ? (json['tags'] as List).map((i) => Tag.fromJson(i)).toList() : null, 
            topics: json['topics'] != null ? (json['topics'] as List).map((i) => Topic.fromJson(i)).toList() : null, 
            urls: json['urls'] != null ? (json['urls'] as List).map((i) => Url.fromJson(i)).toList() : null, 
            videoAutoplayNet: json['videoAutoplayNet'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['articleId'] = this.articleId;
        data['articleStatus'] = this.articleStatus;
        data['articleTitle'] = this.articleTitle;
        data['collectCount'] = this.collectCount;
        data['commentCount'] = this.commentCount;
        data['content'] = this.content;
        data['currentDate'] = this.currentDate;
        data['distanceText'] = this.distanceText;
        data['hasVideo'] = this.hasVideo;
        data['imageCounts'] = this.imageCounts;
        data['isCollected'] = this.isCollected;
        data['isLike'] = this.isLike;
        data['level'] = this.level;
        data['likeCount'] = this.likeCount;
        data['poiName'] = this.poiName;
        data['productType'] = this.productType;
        data['publishTime'] = this.publishTime;
        data['publishTimeDisplay'] = this.publishTimeDisplay;
        data['readCount'] = this.readCount;
        data['shareCount'] = this.shareCount;
        data['shootTime'] = this.shootTime;
        data['shootTimeDisplay'] = this.shootTimeDisplay;
        data['sourceId'] = this.sourceId;
        data['sourceType'] = this.sourceType;
        data['videoAutoplayNet'] = this.videoAutoplayNet;
        if (this.author != null) {
            data['author'] = this.author.toJson();
        }
        if (this.images != null) {
            data['images'] = this.images.map((v) => v.toJson()).toList();
        }
        if (this.pois != null) {
            data['pois'] = this.pois.map((v) => v.toJson()).toList();
        }
        if (this.shareInfo != null) {
            data['shareInfo'] = this.shareInfo.toJson();
        }
        if (this.tags != null) {
            data['tags'] = this.tags.map((v) => v.toJson()).toList();
        }
        if (this.topics != null) {
            data['topics'] = this.topics.map((v) => v.toJson()).toList();
        }
        if (this.urls != null) {
            data['urls'] = this.urls.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Poi {
    num businessId;
    String countryName;
    String districtENName;
    num districtId;
    String districtName;
    bool isInChina;
    num isMain;
    PoiExt poiExt;
    num poiId;
    String poiName;
    num poiType;
    num source;

    Poi({this.businessId, this.countryName, this.districtENName, this.districtId, this.districtName, this.isInChina, this.isMain, this.poiExt, this.poiId, this.poiName, this.poiType, this.source});

    factory Poi.fromJson(Map<String, dynamic> json) {
        return Poi(
            businessId: json['businessId'], 
            countryName: json['countryName'], 
            districtENName: json['districtENName'], 
            districtId: json['districtId'], 
            districtName: json['districtName'], 
            isInChina: json['isInChina'], 
            isMain: json['isMain'], 
            poiExt: json['poiExt'] != null ? PoiExt.fromJson(json['poiExt']) : null, 
            poiId: json['poiId'], 
            poiName: json['poiName'], 
            poiType: json['poiType'], 
            source: json['source'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['businessId'] = this.businessId;
        data['countryName'] = this.countryName;
        data['districtENName'] = this.districtENName;
        data['districtId'] = this.districtId;
        data['districtName'] = this.districtName;
        data['isInChina'] = this.isInChina;
        data['isMain'] = this.isMain;
        data['poiId'] = this.poiId;
        data['poiName'] = this.poiName;
        data['poiType'] = this.poiType;
        data['source'] = this.source;
        if (this.poiExt != null) {
            data['poiExt'] = this.poiExt.toJson();
        }
        return data;
    }
}

class PoiExt {
    String appUrl;
    String h5Url;

    PoiExt({this.appUrl, this.h5Url});

    factory PoiExt.fromJson(Map<String, dynamic> json) {
        return PoiExt(
            appUrl: json['appUrl'], 
            h5Url: json['h5Url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['appUrl'] = this.appUrl;
        data['h5Url'] = this.h5Url;
        return data;
    }
}

class Topic {
    IconImage iconImage;
    num level;
    num topicId;
    String topicName;

    Topic({this.iconImage, this.level, this.topicId, this.topicName});

    factory Topic.fromJson(Map<String, dynamic> json) {
        return Topic(
            iconImage: json['iconImage'] != null ? IconImage.fromJson(json['iconImage']) : null, 
            level: json['level'], 
            topicId: json['topicId'], 
            topicName: json['topicName'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['level'] = this.level;
        data['topicId'] = this.topicId;
        data['topicName'] = this.topicName;
        if (this.iconImage != null) {
            data['iconImage'] = this.iconImage.toJson();
        }
        return data;
    }
}

class IconImage {
    String dynamicUrl;
    num height;
    num imageId;
    num lat;
    num lon;
    num mediaType;
    String originalUrl;
    num width;

    IconImage({this.dynamicUrl, this.height, this.imageId, this.lat, this.lon, this.mediaType, this.originalUrl, this.width});

    factory IconImage.fromJson(Map<String, dynamic> json) {
        return IconImage(
            dynamicUrl: json['dynamicUrl'], 
            height: json['height'], 
            imageId: json['imageId'], 
            lat: json['lat'], 
            lon: json['lon'], 
            mediaType: json['mediaType'], 
            originalUrl: json['originalUrl'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['dynamicUrl'] = this.dynamicUrl;
        data['height'] = this.height;
        data['imageId'] = this.imageId;
        data['lat'] = this.lat;
        data['lon'] = this.lon;
        data['mediaType'] = this.mediaType;
        data['originalUrl'] = this.originalUrl;
        data['width'] = this.width;
        return data;
    }
}

class ShareInfo {
    String imageUrl;
    String platForm;
    String shareContent;
    String shareTitle;
    String token;

    ShareInfo({this.imageUrl, this.platForm, this.shareContent, this.shareTitle, this.token});

    factory ShareInfo.fromJson(Map<String, dynamic> json) {
        return ShareInfo(
            imageUrl: json['imageUrl'], 
            platForm: json['platForm'], 
            shareContent: json['shareContent'], 
            shareTitle: json['shareTitle'], 
            token: json['token'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['imageUrl'] = this.imageUrl;
        data['platForm'] = this.platForm;
        data['shareContent'] = this.shareContent;
        data['shareTitle'] = this.shareTitle;
        data['token'] = this.token;
        return data;
    }
}

class Author {
    num authorId;
    String clientAuth;
    CoverImage coverImage;
    String describe;
    num followCount;
    num identityType;
    String identityTypeName;
    String jumpUrl;
    String nickName;
    String qualification;
    String tag;

    Author({this.authorId, this.clientAuth, this.coverImage, this.describe, this.followCount, this.identityType, this.identityTypeName, this.jumpUrl, this.nickName, this.qualification, this.tag});

    factory Author.fromJson(Map<String, dynamic> json) {
        return Author(
            authorId: json['authorId'], 
            clientAuth: json['clientAuth'], 
            coverImage: json['coverImage'] != null ? CoverImage.fromJson(json['coverImage']) : null, 
            describe: json['describe'], 
            followCount: json['followCount'], 
            identityType: json['identityType'], 
            identityTypeName: json['identityTypeName'], 
            jumpUrl: json['jumpUrl'], 
            nickName: json['nickName'], 
            qualification: json['qualification'], 
            tag: json['tag'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['authorId'] = this.authorId;
        data['clientAuth'] = this.clientAuth;
        data['describe'] = this.describe;
        data['followCount'] = this.followCount;
        data['identityType'] = this.identityType;
        data['identityTypeName'] = this.identityTypeName;
        data['jumpUrl'] = this.jumpUrl;
        data['nickName'] = this.nickName;
        data['qualification'] = this.qualification;
        data['tag'] = this.tag;
        if (this.coverImage != null) {
            data['coverImage'] = this.coverImage.toJson();
        }
        return data;
    }
}

class CoverImage {
    String dynamicUrl;
    String originalUrl;

    CoverImage({this.dynamicUrl, this.originalUrl});

    factory CoverImage.fromJson(Map<String, dynamic> json) {
        return CoverImage(
            dynamicUrl: json['dynamicUrl'], 
            originalUrl: json['originalUrl'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['dynamicUrl'] = this.dynamicUrl;
        data['originalUrl'] = this.originalUrl;
        return data;
    }
}

class Url {
    String appUrl;
    String h5Url;
    String version;
    String wxUrl;

    Url({this.appUrl, this.h5Url, this.version, this.wxUrl});

    factory Url.fromJson(Map<String, dynamic> json) {
        return Url(
            appUrl: json['appUrl'], 
            h5Url: json['h5Url'], 
            version: json['version'], 
            wxUrl: json['wxUrl'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['appUrl'] = this.appUrl;
        data['h5Url'] = this.h5Url;
        data['version'] = this.version;
        data['wxUrl'] = this.wxUrl;
        return data;
    }
}

class Tag {
    num parentTagId;
    num sortIndex;
    num source;
    num tagId;
    num tagLevel;
    String tagName;

    Tag({this.parentTagId, this.sortIndex, this.source, this.tagId, this.tagLevel, this.tagName});

    factory Tag.fromJson(Map<String, dynamic> json) {
        return Tag(
            parentTagId: json['parentTagId'], 
            sortIndex: json['sortIndex'], 
            source: json['source'], 
            tagId: json['tagId'], 
            tagLevel: json['tagLevel'], 
            tagName: json['tagName'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['parentTagId'] = this.parentTagId;
        data['sortIndex'] = this.sortIndex;
        data['source'] = this.source;
        data['tagId'] = this.tagId;
        data['tagLevel'] = this.tagLevel;
        data['tagName'] = this.tagName;
        return data;
    }
}

class ImageModel {
    String dynamicUrl;
    num height;
    num imageId;
    bool isWaterMarked;
    num lat;
    num lon;
    num mediaType;
    String originalUrl;
    num width;

    ImageModel({this.dynamicUrl, this.height, this.imageId, this.isWaterMarked, this.lat, this.lon, this.mediaType, this.originalUrl, this.width});

    factory ImageModel.fromJson(Map<String, dynamic> json) {
        return ImageModel(
            dynamicUrl: json['dynamicUrl'], 
            height: json['height'], 
            imageId: json['imageId'], 
            isWaterMarked: json['isWaterMarked'], 
            lat: json['lat'], 
            lon: json['lon'], 
            mediaType: json['mediaType'], 
            originalUrl: json['originalUrl'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['dynamicUrl'] = this.dynamicUrl;
        data['height'] = this.height;
        data['imageId'] = this.imageId;
        data['isWaterMarked'] = this.isWaterMarked;
        data['lat'] = this.lat;
        data['lon'] = this.lon;
        data['mediaType'] = this.mediaType;
        data['originalUrl'] = this.originalUrl;
        data['width'] = this.width;
        return data;
    }
}