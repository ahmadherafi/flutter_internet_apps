import 'package:flutter_internet_apps/core/local_storage/local_storage.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/models/login_request.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/models/login_response.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/models/register.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/source/auth_service.dart';
import 'package:get/get.dart';
import 'package:rx_future/rx_future.dart';

class AuthController extends GetxController {
  RxFuture<void> registerState = RxFuture(null);
  RegisterModel registerModel = RegisterModel.zero();
  AuthService authService = AuthService();
  LocalStorage localStorage = LocalStorage();

  Future<void> register({void Function(void)? onSuccess, void Function(Object)? onError}) async {
    await registerState.observe(
      (p0) async {
        await authService.register(registerModel);
      },
      onSuccess: (p0) {
        onSuccess?.call(p0);
      },
      onError: (p0) {
        onError?.call(p0);
      },
    );
  }

  RxFuture<LoginResponseModel> loginState = RxFuture(LoginResponseModel.zero());
  LoginRequestModel loginRequestModel = LoginRequestModel.zero();
  Future<void> login({void Function(LoginResponseModel)? onSuccess, void Function(Object)? onError}) async {
    await loginState.observe(
      (p0) async {
        return await authService.login(loginRequestModel);
      },
      onSuccess: (p0) {
        localStorage.saveToken(p0.token);
        onSuccess?.call(p0);
      },
      onError: (p0) {
        onError?.call(p0);
      },
    );
  }
}
