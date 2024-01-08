import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/constant/const.dart';
import 'package:flutter_internet_apps/common/widgets/appbar.dart';
import 'package:flutter_internet_apps/common/widgets/button.dart';
import 'package:flutter_internet_apps/common/widgets/drawer.dart';
import 'package:flutter_internet_apps/common/widgets/rx_veiwer.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/features/auth/presentation_layer/widgets/textfield.dart';
import 'package:flutter_internet_apps/features/group/busniess_logic_layer/group_controller.dart';
import 'package:flutter_internet_apps/features/group/data_layer/models/add_group.dart';
import 'package:flutter_internet_apps/features/home/presentation_layer/widgets/group.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class MyGroupScreen extends StatelessWidget {
  GroupController groupController = Get.find<GroupController>();
  MyGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    groupController.myGroup();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addGroupDialog();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: AppColors.primeColor,
      appBar: const AppBarWidget(),
      drawer: const DrawerWidget(),
      body: RxViewer(
          rxFuture: groupController.myGroupState,
          child: () => SizedBox(
                width: Get.width,
                child: GridView.builder(
                    itemCount: groupController.myGroupState.result.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: Get.width / Get.height * 3.5,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return GroupWidget(
                        groupModel: groupController.myGroupState.result[index].groupModel,
                      );
                    }),
              )),
    );
  }

  void addGroupDialog() {
    Get.defaultDialog(
        title: "",
        middleText: "",
        backgroundColor: Colors.white,
        content: SizedBox(
          height: Get.height * .3,
          child: Column(
            children: [
              TextFieldWidget(
                onChange: (value) {
                  groupController.addGroupModel.value.name = value;
                },
                keyboardType: TextInputType.name,
                hint: "الاسم",
                validate: (value) {
                  return null;
                },
              ),
              Row(
                children: [
                  TextWidget(
                    "محموعة عامة",
                    color: AppColors.primeColor,
                  ),
                  Obx(() {
                    return Checkbox(
                      value: groupController.addGroupModel.value.type == GROUPTYPE.public,
                      onChanged: (value) {
                        if (value!) {
                          groupController.addGroupModel.value.type = GROUPTYPE.public;
                        } else {
                          groupController.addGroupModel.value.type = GROUPTYPE.nothing;
                        }
                        groupController.addGroupModel.update((val) {});
                      },
                    );
                  }),
                  TextWidget(
                    "محموعة خاصة",
                    color: AppColors.primeColor,
                  ),
                  Obx(() {
                    return Checkbox(
                      value: groupController.addGroupModel.value.type == GROUPTYPE.private,
                      onChanged: (value) {
                        log(value.toString());
                        if (value!) {
                          groupController.addGroupModel.value.type = GROUPTYPE.private;
                          log(groupController.addGroupModel.value.type.toString());
                        } else {
                          groupController.addGroupModel.value.type = GROUPTYPE.nothing;
                        }

                        groupController.addGroupModel.update((val) {});
                      },
                    );
                  }),
                ],
              ),
              ButtonWidget(
                  title: "اختر ملف",
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

                    if (result != null) {
                      // This is the path of the selected PDF file
                      String filePath = result.files.single.path!;
                      groupController.addGroupModel.value.file = File(result.files.single.path!);
                      // Do something with the file path
                    }
                  }).paddingSymmetric(vertical: 4),
              Obx(() {
                return ButtonWidget(
                    isLoading: groupController.addGroupState.loading,
                    title: "إضافة",
                    onTap: () {
                      groupController.addGroup();
                    });
              })
            ],
          ),
        ));
  }
}
