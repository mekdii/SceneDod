// To parse this JSON data, do
//
//     final announcement = announcementFromJson(jsonString);

import 'dart:convert';

List<Announcement> announcementFromJson(String str) => List<Announcement>.from(
    json.decode(str).map((x) => Announcement.fromJson(x)));

String announcementToJson(List<Announcement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Announcement {
  Announcement({
    this.id,
    this.title,
    this.description,
    this.postedAt,
    this.imageUrl,
    this.sectorId,
  });

  int id;
  String title;
  String description;
  DateTime postedAt;
  String imageUrl;
  int sectorId;

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        postedAt: DateTime.parse(json["posted_at"]),
        imageUrl: json["image_url"],
        sectorId: json["sector_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "posted_at": postedAt.toIso8601String(),
        "image_url": imageUrl,
        "sector_id": sectorId,
      };
}
