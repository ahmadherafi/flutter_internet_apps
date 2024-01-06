import 'package:flutter_internet_apps/features/auth/busiess_logic_layer/auth_controller.dart';
import 'package:flutter_internet_apps/features/home/business_logic_layer/home_controller.dart';
import 'package:flutter_internet_apps/features/splash/business_logic_layer/splash_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void injectDependencies() {
    Get.put(SplashController());
    Get.put(AuthController());
    Get.put(HomeController());
  }
}
