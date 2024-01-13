import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/button.dart';
import 'package:flutter_internet_apps/common/widgets/rx_veiwer.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:flutter_internet_apps/features/auth/presentation_layer/widgets/textfield.dart';
import 'package:flutter_internet_apps/features/file/business_logic_layer/file_controller.dart';
import 'package:flutter_internet_apps/features/group/busniess_logic_layer/group_controller.dart';
import 'package:flutter_internet_apps/features/home/data_layer/model/group.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class GroupWidget extends StatelessWidget {
  final GroupModel groupModel;
  GroupController groupController = Get.find<GroupController>();
  FileController fileController = Get.find<FileController>();
  bool? myGroup;
  GroupWidget({super.key, required this.groupModel, this.myGroup = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: Get.width * .5,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: Get.width * .2,
                height: 30,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                  ),
                ),
                child: TextWidget(groupModel.type, fontSize: 14),
              ),
              myGroup!
                  ? PopupMenuButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: const TextWidget("حذف", color: Colors.black),
                          onTap: () {
                            groupController.deleteGroup(groupModel.id);
                          },
                        ),
                        PopupMenuItem(
                          child: const TextWidget("ضم عضو", color: Colors.black),
                          onTap: () {
                            dialog();
                          },
                        ),
                        PopupMenuItem(
                          child: const TextWidget("حذف عضو", color: Colors.black),
                          onTap: () {
                            getUserDialog();
                            groupController.getUserForGroup(groupModel.id);
                          },
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget("${groupModel.name}   "),
              const Icon(
                Icons.folder,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    ).onTap(() {
      RoutingManager.to(RoutesName.file, arguments: groupModel.id);
      fileController.getFile(groupModel.id);
    });
  }

  void getUserDialog() {
    Get.defaultDialog(
      title: "",
      middleText: "",
      content: SizedBox(
        width: Get.width * .8,
        height: 300,
        child: RxViewer(
          rxFuture: groupController.getUserState,
          child: () => ListView.builder(
              shrinkWrap: true,
              itemCount: groupController.getUserState.result.length,
              itemBuilder: (BuildContext context, index) {
                return SizedBox(
                  width: Get.width * .6,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          TextWidget(
                            groupController.getUserState.result[index].userModel.name,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const Icon(Icons.delete).onTap(() {
                        groupController.deleteUserFormGroup(
                            groupController.getUserState.result[index].userModel.id, groupModel.id);
                      }),
                    ],
                  ).paddingSymmetric(horizontal: 10),
                );
              }),
        ),
      ),
    );
  }

  void dialog() {
    Get.defaultDialog(
        title: "",
        middleText: "",
        content: Column(
          children: [
            TextFieldWidget(
              onChange: (value) {
                groupController.email = value;
              },
              keyboardType: TextInputType.emailAddress,
              hint: "البريد",
              validate: (value) {
                return null;
              },
            ),
            Obx(() {
              return ButtonWidget(
                  isLoading: groupController.joinUserToGroupState.loading,
                  title: "اضافة عضو",
                  onTap: () {
                    groupController.joinUserToGroup(groupModel.id);
                  });
            }),
          ],
        ));
  }
}
