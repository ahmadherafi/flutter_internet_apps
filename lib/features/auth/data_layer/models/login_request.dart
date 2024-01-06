class LoginRequestModel {
  String userName;
  String password;
  LoginRequestModel({
    required this.userName,
    required this.password,
  });
  factory LoginRequestModel.zero() => LoginRequestModel(
        userName: "",
        password: "",
      );

  Map<String, dynamic> toJson() => {
        "name": userName,
        "password": password,
      };
}
