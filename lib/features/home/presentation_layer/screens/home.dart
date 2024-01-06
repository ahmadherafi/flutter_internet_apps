import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/rx_veiwer.dart';
import 'package:flutter_internet_apps/features/home/business_logic_layer/home_controller.dart';
import 'package:flutter_internet_apps/features/home/presentation_layer/widgets/group.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    homeController.getGroups();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 31, 33, 34),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 31, 33, 34),
        ),
        body: RxViewer(
            rxFuture: homeController.groupsState,
            child: () => SizedBox(
                  width: Get.width,
                  child: GridView.builder(
                      itemCount: homeController.groupsState.result.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: Get.width / Get.height * 3.5,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        return GroupWidget(
                          groupModel: homeController.groupsState.result[index].groupModel,
                        );
                      }),
                )));
  }
}
