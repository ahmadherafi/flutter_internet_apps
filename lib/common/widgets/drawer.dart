// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
// import 'package:flutter_internet_apps/common/widgets/text.dart';
// import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
// import 'package:flutter_internet_apps/features/auth/busiess_logic_layer/auth_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/utils.dart';

// class DrawerWidget extends StatelessWidget {
//   AuthController authController = Get.find<AuthController>();
//   DrawerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const TextWidget(
//             "الرئيسية",
//             color: Colors.black,
//           ).onTap(() {
//             RoutingManager.to(RoutesName.home);
//           }),
//           const TextWidget(
//             "المجموعات الشخصية",
//             color: Colors.black,
//           ).onTap(() {
//             RoutingManager.to(RoutesName.myGroup);
//           }),
//           const TextWidget(
//             "المجموعات الخاصة",
//             color: Colors.black,
//           ).onTap(() {
//             RoutingManager.to(RoutesName.privateGroup);
//           }),
//           const TextWidget(
//             "المجموعات العامة",
//             color: Colors.black,
//           ).onTap(() {
//             RoutingManager.to(RoutesName.publicGroup);
//           }),
//           const TextWidget(
//             "تسجيل الخروج",
//             color: Colors.black,
//           ).onTap(() {
//             authController.logout();
//           })
//         ],
//       ).paddingSymmetric(vertical: 30, horizontal: 10),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:flutter_internet_apps/features/auth/busiess_logic_layer/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class DrawerWidget extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();
  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.home, color: Colors.black), // Replace with the desired icon
            title: const TextWidget(
              "الرئيسية",
              color: Colors.black,
            ),
            onTap: () {
              RoutingManager.to(RoutesName.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.black), // Replace with the desired icon
            title: const TextWidget(
              "المجموعات الشخصية",
              color: Colors.black,
            ),
            onTap: () {
              RoutingManager.to(RoutesName.myGroup);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.black), // Replace with the desired icon
            title: const TextWidget(
              "المجموعات الخاصة",
              color: Colors.black,
            ),
            onTap: () {
              RoutingManager.to(RoutesName.privateGroup);
            },
          ),
          ListTile(
            leading: const Icon(Icons.public, color: Colors.black), // Replace with the desired icon
            title: const TextWidget(
              "المجموعات العامة",
              color: Colors.black,
            ),
            onTap: () {
              RoutingManager.to(RoutesName.publicGroup);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.bookmark_border,
              color: Colors.black,
            ), // Replace with the desired icon
            title: const TextWidget(
              "حجوزاتي",
              color: Colors.black,
            ),
            onTap: () {
              RoutingManager.to(RoutesName.myAppointment);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black), // Replace with the desired icon
            title: const TextWidget(
              "تسجيل الخروج",
              color: Colors.black,
            ),
            onTap: () {
              authController.logout();
            },
          ),
        ],
      ).paddingSymmetric(vertical: 60, horizontal: 1),
    );
  }
}
