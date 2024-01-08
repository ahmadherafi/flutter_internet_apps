import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/models/login_response.dart';
import 'package:flutter_internet_apps/features/group/data_layer/models/user.dart';

class FileModel {
  int id;
  String name;
  String status;
  String link;
  int groupId;
  UserModel user;
  String createdAt;

  FileModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.link,
      required this.groupId,
      required this.user,
      required this.createdAt});

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      link: json["link"],
      groupId: json["group_id"],
      user: UserModel.fromJson(json["user"]),
      createdAt: json["created_at"]);

  static List<FileModel> fromJsonList(Map<String, dynamic> json) {
    List<FileModel> list = [];

    json["data"].forEach(
      (element) => list.add(
        FileModel.fromJson(element),
      ),
    );
    return list;
  }
}
