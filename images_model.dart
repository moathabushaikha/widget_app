// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

List<ServerImage> imageFromJson(String str) => List<ServerImage>.from(
    json.decode(str).map((x) => ServerImage.fromJson(x)));

String imageToJson(List<ServerImage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServerImage {
  ServerImage({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory ServerImage.fromJson(Map<String, dynamic> json) => ServerImage(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
