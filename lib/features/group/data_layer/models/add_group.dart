import 'dart:io';

import 'package:dio/dio.dart';

enum GROUPTYPE { private, public, nothing }

class AddGroupModel {
  String name;
  GROUPTYPE type;
  File file;

  AddGroupModel({
    required this.name,
    required this.type,
    required this.file,
  });

  factory AddGroupModel.zero() => AddGroupModel(
        name: "",
        type: GROUPTYPE.nothing,
        file: File(""),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type == GROUPTYPE.private ? "private" : "public",
        'link': MultipartFile.fromFileSync(file.path),
      };
}
