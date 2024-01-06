import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/features/splash/business_logic_layer/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class SplashScreen extends StatelessWidget {
  SplashController splashController = Get.find<SplashController>();
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        splashController.checkToken();
      },
    );
    return const Placeholder();
  }
}
