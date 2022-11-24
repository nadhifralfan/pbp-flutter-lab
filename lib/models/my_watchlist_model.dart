// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<MyWatchList> movieFromJson(String str) => List<MyWatchList>.from(
    json.decode(str).map((x) => MyWatchList.fromJson(x)));

String movieToJson(List<MyWatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.watched,
    required this.pk,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  int pk;
  bool watched;
  String title;
  int rating;
  String releaseDate;
  String review;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
        pk: json["pk"],
        watched: json["fields"]["watched"] == "Yes" ? true : false,
        title: json["fields"]["title"],
        rating: json["fields"]["rating"],
        releaseDate: json["fields"]["release_date"],
        review: json["fields"]["review"],
      );

  Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date": releaseDate,
        "review": review,
      };
}
