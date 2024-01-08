import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:get/utils.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            "الرئيسية",
            color: Colors.black,
          ).onTap(() {
            RoutingManager.to(RoutesName.home);
          }),
          const TextWidget(
            "المجموعات الشخصية",
            color: Colors.black,
          ).onTap(() {
            RoutingManager.to(RoutesName.myGroup);
          }),
          const TextWidget(
            "المجموعات الخاصة",
            color: Colors.black,
          ).onTap(() {
            RoutingManager.to(RoutesName.privateGroup);
          }),
          const TextWidget(
            "المجموعات العامة",
            color: Colors.black,
          ).onTap(() {
            RoutingManager.to(RoutesName.publicGroup);
          }),
        ],
      ).paddingSymmetric(vertical: 30, horizontal: 10),
    );
  }
}
