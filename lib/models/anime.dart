import 'package:json_annotation/json_annotation.dart';

part 'anime.g.dart';

@JsonSerializable()
class Anime {
  List<DataBean>? data;
  MetaBean? meta;

  Anime({this.data, this.meta});

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class MetaBean {
  num? page;
  num? size;
  num? totalData;
  num? totalPage;

  MetaBean({this.page, this.size, this.totalData, this.totalPage});

  factory MetaBean.fromJson(Map<String, dynamic> json) => _$MetaBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MetaBeanToJson(this);
}

@JsonSerializable()
class DataBean {
  String? id;
  String? title;
  List<String>? alternativeTitles;
  num? ranking;
  List<String>? genres;
  num? episodes;
  bool? hasEpisode;
  bool? hasRanking;
  String? image;
  String? link;
  String? status;
  String? synopsis;
  String? thumb;
  String? type;

  DataBean({this.id, this.title, this.alternativeTitles, this.ranking, this.genres, this.episodes, this.hasEpisode, this.hasRanking, this.image, this.link, this.status, this.synopsis, this.thumb, this.type});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

