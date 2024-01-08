import 'package:flutter_internet_apps/core/api/end_point.dart';
import 'package:flutter_internet_apps/core/network/http.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/models/login_request.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/models/login_response.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/models/register.dart';

class AuthService {
  Future<void> register(RegisterModel registerModel) async {
    Request request = Request(
      EndPoint.register,
      RequestMethod.post,
      body: registerModel.toJson(),
      isFormData: true,
      headers: {"Accept": "application/json"},
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    Request request = Request(
      EndPoint.login,
      RequestMethod.post,
      body: loginRequestModel.toJson(),
      isFormData: true,
      headers: {"Accept": "application/json"},
    );
    Map<String, dynamic> response = await request.sendRequest();
    return LoginResponseModel.fromJson(response);
  }

  Future<void> logout() async {
    Request request = Request(
      EndPoint.logout,
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
  }
}
