class LoginResponseModel {
  String token;
  UserModel user;

  LoginResponseModel({
    required this.user,
    required this.token,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );

  factory LoginResponseModel.zero() => LoginResponseModel(
        user: UserModel.zero(),
        token: "",
      );
}

class UserModel {
  int id;
  String name;
  String email;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  factory UserModel.zero() => UserModel(
        id: 0,
        name: "",
        email: "",
      );
}
