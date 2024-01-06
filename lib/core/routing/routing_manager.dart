import 'package:flutter_internet_apps/features/auth/presentation_layer/screens/login.dart';
import 'package:flutter_internet_apps/features/auth/presentation_layer/screens/register.dart';
import 'package:flutter_internet_apps/features/home/presentation_layer/screens/home.dart';
import 'package:flutter_internet_apps/features/splash/presentation_layer/screen/splash.dart';
import 'package:get/get.dart';

class RoutesName {
  static String splash = '/splash';
  static String login = '/login';
  static String register = '/register';
  static String home = '/home';
}

class RoutingManager {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: RoutesName.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesName.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutesName.splash,
      page: () => SplashScreen(),
    ),
  ];

  static void off(String route) {
    Get.offNamed(route);
  }

  static void offAll(String route) {
    Get.offAllNamed(route);
  }

  static void to(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static void back() {
    Get.back();
  }
}
