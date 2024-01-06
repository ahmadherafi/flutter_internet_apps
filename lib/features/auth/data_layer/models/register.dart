class RegisterModel {
  String userName;
  String email;
  String password;
  RegisterModel({
    required this.userName,
    required this.email,
    required this.password,
  });
  factory RegisterModel.zero() => RegisterModel(
        userName: "",
        email: "",
        password: "",
      );

  Map<String, dynamic> toJson() => {
        "name": userName,
        "email": email,
        "password": password,
      };
}
