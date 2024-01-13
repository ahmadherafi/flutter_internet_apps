import 'dart:io';

import 'package:dio/dio.dart';

class AddFileModel {
  String name;
  int groupId;
  File file;

  AddFileModel({
    required this.name,
    required this.groupId,
    required this.file,
  });

  factory AddFileModel.zero() => AddFileModel(
        name: "",
        groupId: 0,
        file: File(""),
      );

  Map<String, dynamic> toJson() => {'name': name, 'group_id': groupId, 'link': MultipartFile.fromFileSync(file.path)};
}
