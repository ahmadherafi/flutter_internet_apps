import 'package:flutter_internet_apps/features/auth/data_layer/models/login_response.dart';

class User {
  int id;
  UserModel userModel;

  User({
    required this.id,
    required this.userModel,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userModel: UserModel.fromJson(json["user"]),
      );

  static List<User> fromJsonList(Map<String, dynamic> json) {
    List<User> list = [];

    json["data"].forEach(
      (element) => list.add(
        User.fromJson(element),
      ),
    );

    return list;
  }
}
