import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/button.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:flutter_internet_apps/features/auth/busiess_logic_layer/auth_controller.dart';
import 'package:flutter_internet_apps/features/auth/presentation_layer/widgets/textfield.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
            onChange: (value) {
              authController.registerModel.userName = value;
            },
            keyboardType: TextInputType.name,
            hint: "اسم المستخدم",
            validate: (value) {
              return null;
            },
          ).paddingSymmetric(vertical: 20),
          TextFieldWidget(
            onChange: (value) {
              authController.registerModel.email = value;
            },
            keyboardType: TextInputType.name,
            hint: "البريد الإلكتروني",
            validate: (value) {
              return null;
            },
          ).paddingOnly(bottom: 20),
          TextFieldWidget(
            onChange: (value) {
              authController.registerModel.password = value;
            },
            keyboardType: TextInputType.name,
            hint: "كلمة المرور",
            validate: (value) {
              return null;
            },
          ),
          Obx(() {
            return ButtonWidget(
              isLoading: authController.registerState.loading,
              title: "إنشاء حساب",
              width: Get.width * .5,
              onTap: () async {
                await authController.register();
              },
            ).paddingSymmetric(vertical: 20);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                "تسجيل الدخول",
                color: Colors.black,
              ).onTap(() {
                RoutingManager.offAll(RoutesName.login);
              }),
              const TextWidget(
                "لديك حساب سابق؟",
                color: Colors.black,
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
