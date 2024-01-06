import 'package:flutter_internet_apps/core/local_storage/local_storage.dart';
import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  LocalStorage localStorage = LocalStorage();

  Future<void> checkToken() async {
    if (localStorage.getToken() != null) {
      RoutingManager.offAll(RoutesName.home);
    } else {
      RoutingManager.offAll(RoutesName.login);
    }
  }
}
