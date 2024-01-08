import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/common/widgets/button.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/features/auth/presentation_layer/widgets/textfield.dart';
import 'package:flutter_internet_apps/features/group/busniess_logic_layer/group_controller.dart';
import 'package:flutter_internet_apps/features/home/data_layer/model/group.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class GroupWidget extends StatelessWidget {
  final GroupModel groupModel;
  GroupController groupController = Get.find<GroupController>();
  GroupWidget({super.key, required this.groupModel});

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
              PopupMenuButton(
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
                ],
              )
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
