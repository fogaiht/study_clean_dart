import 'package:flutter/foundation.dart';
import 'package:study_clean_dart/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String login;
  final int id;
  final String avatarUrl;

  ResultSearchModel({
    @required this.login,
    @required this.id,
    @required this.avatarUrl,
  });

  ResultSearchModel copyWith({
    String login,
    int id,
    String avatarUrl,
  }) =>
      ResultSearchModel(
        login: login ?? this.login,
        id: id ?? this.id,
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );

  factory ResultSearchModel.fromJson(Map<String, dynamic> json) => ResultSearchModel(
        login: json["login"] == null ? null : json["login"],
        id: json["id"] == null ? null : json["id"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "id": id == null ? null : id,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
      };
}
