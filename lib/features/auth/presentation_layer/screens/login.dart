import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/button.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:flutter_internet_apps/features/auth/busiess_logic_layer/auth_controller.dart';
import 'package:flutter_internet_apps/features/auth/presentation_layer/widgets/textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
            onChange: (value) {
              authController.loginRequestModel.userName = value;
            },
            keyboardType: TextInputType.name,
            hint: "اسم المستخدم",
            validate: (value) {
              return null;
            },
          ).paddingSymmetric(vertical: 20),
          TextFieldWidget(
            onChange: (value) {
              authController.loginRequestModel.password = value;
            },
            keyboardType: TextInputType.name,
            hint: "كلمة المرور",
            validate: (value) {
              return null;
            },
          ),
          Obx(() {
            return ButtonWidget(
              isLoading: authController.loginState.loading,
              title: "تسجيل الدخول",
              width: Get.width * .5,
              onTap: () async {
                await authController.login(
                  onSuccess: (value) {
                    RoutingManager.offAll(RoutesName.home);
                  },
                );
              },
            ).paddingSymmetric(vertical: 20);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                "إنشاء حساب",
                color: Colors.black,
              ).onTap(() {
                RoutingManager.to(RoutesName.register);
              }),
              const TextWidget(
                "  ليس لديك حساب؟",
                color: Colors.black,
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
