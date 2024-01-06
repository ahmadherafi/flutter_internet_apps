import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final storage = GetStorage();

  Future<void> saveToken(String token) async {
    await storage.write('token', token);
  }

  Future<void> clear() async {
    await storage.erase();
  }

  String? getToken() {
    return storage.read('token');
  }
}
