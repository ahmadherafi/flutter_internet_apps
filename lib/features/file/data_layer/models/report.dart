import 'dart:ui';

import 'package:flutter_internet_apps/features/auth/data_layer/models/login_response.dart';

class ReportModel {
  int id;
  String name;
  String status;
  String link;
  int userId;
  List<AppointmentModell> list;
  ReportModel({
    required this.id,
    required this.name,
    required this.status,
    required this.link,
    required this.userId,
    required this.list,
  });
  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        link: json["link"],
        userId: json["user_id"],
        list: AppointmentModell.fromJsonList(json),
      );

  static List<ReportModel> fromJsonList(Map<String, dynamic> json) {
    List<ReportModel> reports = [];

    json["data"].forEach(
      (element) => reports.add(
        ReportModel.fromJson(element),
      ),
    );
    return reports;
  }
}

class AppointmentModell {
  int id;
  int userId;
  int fileId;
  String startTime;
  String endTime;
  String status;
  UserModel user;
  AppointmentModell({
    required this.id,
    required this.userId,
    required this.fileId,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.user,
  });

  factory AppointmentModell.fromJson(Map<String, dynamic> json) => AppointmentModell(
        id: json["id"],
        userId: json["user_id"],
        fileId: json["file_id"],
        startTime: json["start_time"],
        endTime: json["end_time"].toString(),
        status: json["status"],
        user: UserModel.fromJson(
          json["user"],
        ),
      );

  static List<AppointmentModell> fromJsonList(Map<String, dynamic> json) {
    List<AppointmentModell> list = [];
    json["appointment"].forEach(
      (elemet) => list.add(
        AppointmentModell.fromJson(elemet),
      ),
    );
    return list;
  }
}
