import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/features/splash/business_logic_layer/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        splashController.checkToken();
      },
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            height: 200,
            alignment: Alignment.center,
            child: Image.asset("assets/images/download.jpeg"),
          )
        ],
      ),
    );
  }
}
