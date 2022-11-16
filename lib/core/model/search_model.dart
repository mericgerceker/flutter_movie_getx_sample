import 'base_model.dart';

class SearchModel extends BaseModel {
  List<TitleResults>? titleResults;

  SearchModel({this.titleResults});

  @override
  fromJson(Map<String, dynamic> json) => SearchModel(
    titleResults: List<TitleResults>.from(json["title_results"].map((x) => TitleResults().fromJson(x))),
  );

  @override
  Map<String, dynamic> toJson() => {
    "title_results": titleResults != null ? List<dynamic>.from(titleResults!.map((x) => x.toJson())) : [],
  };
}

class TitleResults extends BaseModel {
  String? resultType;
  int? id;
  String? name;
  String? type;
  int? year;
  String? imdbId;
  int? tmdbId;
  String? tmdbType;

  TitleResults(
      {this.resultType,
        this.id,
        this.name,
        this.type,
        this.year,
        this.imdbId,
        this.tmdbId,
        this.tmdbType});

  @override
  fromJson(Map<String, dynamic> json) => TitleResults(
  resultType: json["resultType"],
  id: json["id"],
  name: json["name"],
  type: json["type"],
  year: json["year"],
  imdbId: json["imdb_id"],
  tmdbId: json["tmdb_id"],
  tmdbType: json["tmdb_type"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "resultType": resultType,
    "id": id,
    "name": name,
    "type": type,
    "year": year,
    "imdb_id": imdbId,
    "tmdb_id": tmdbId,
    "tmdb_type": tmdbType,
  };
}