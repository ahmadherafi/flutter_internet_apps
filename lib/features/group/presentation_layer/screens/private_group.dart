import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/constant/const.dart';
import 'package:flutter_internet_apps/common/widgets/appbar.dart';
import 'package:flutter_internet_apps/common/widgets/drawer.dart';
import 'package:flutter_internet_apps/common/widgets/rx_veiwer.dart';
import 'package:flutter_internet_apps/features/group/busniess_logic_layer/group_controller.dart';
import 'package:flutter_internet_apps/features/home/presentation_layer/widgets/group.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class PrivateGroupScreen extends StatelessWidget {
  GroupController groupController = Get.find<GroupController>();
  PrivateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    groupController.getPrivateGroup();
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const AppBarWidget(),
      backgroundColor: AppColors.primeColor,
      body: RxViewer(
          rxFuture: groupController.privateGroupState,
          child: () => SizedBox(
                width: Get.width,
                child: GridView.builder(
                    itemCount: groupController.privateGroupState.result.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: Get.width / Get.height * 3.5,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return GroupWidget(
                        groupModel: groupController.privateGroupState.result[index].groupModel,
                      );
                    }),
              )),
    );
  }
}
