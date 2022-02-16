// To parse this JSON data, do
//
//     final report = reportFromJson(jsonString);

import 'dart:convert';

List<Report> reportFromJson(String str) =>
    List<Report>.from(json.decode(str).map((x) => Report.fromJson(x)));

String reportToJson(List<Report> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Report {
  Report({
    this.reportId,
    this.sceneImageUrl,
    this.tag,
    this.description,
    this.postedAt,
    this.resolvedAt,
    this.userId,
    this.state,
    this.locationId,
    this.sectorId,
  });

  int reportId;
  String sceneImageUrl;
  String tag;
  String description;
  DateTime postedAt;
  dynamic resolvedAt;
  int userId;
  bool state;
  int locationId;
  int sectorId;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        reportId: json["report_id"],
        sceneImageUrl: json["scene_image_url"],
        tag: json["tag"],
        description: json["description"],
        postedAt: DateTime.parse(json["posted_at"]),
        resolvedAt: json["resolved_at"],
        userId: json["user_id"],
        state: json["state"],
        locationId: json["location_id"],
        sectorId: json["sector_id"],
      );

  Map<String, dynamic> toJson() => {
        "report_id": reportId,
        "scene_image_url": sceneImageUrl,
        "tag": tag,
        "description": description,
        "posted_at": postedAt.toIso8601String(),
        "resolved_at": resolvedAt,
        "user_id": userId,
        "state": state,
        "location_id": locationId,
        "sector_id": sectorId,
      };
}
