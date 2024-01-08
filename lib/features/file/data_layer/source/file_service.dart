import 'dart:io';

import 'package:flutter_internet_apps/core/api/end_point.dart';
import 'package:flutter_internet_apps/core/network/http.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/file.dart';

class FileService {
  Future<List<FileModel>> getFile(int groupId) async {
    Request request = Request(
      EndPoint.getFile(groupId),
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();

    return FileModel.fromJsonList(response);
  }
}
