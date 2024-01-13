import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/constant/const.dart';
import 'package:flutter_internet_apps/common/widgets/appbar.dart';
import 'package:flutter_internet_apps/common/widgets/button.dart';
import 'package:flutter_internet_apps/common/widgets/rx_veiwer.dart';
import 'package:flutter_internet_apps/features/auth/presentation_layer/widgets/textfield.dart';
import 'package:flutter_internet_apps/features/file/business_logic_layer/file_controller.dart';
import 'package:flutter_internet_apps/features/file/presentation_layer/widgets/file.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class FileScreen extends StatelessWidget {
  FileController fileController = Get.find<FileController>();
  int groupId = Get.arguments;
  FileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addFileDialog();
          }),
      backgroundColor: AppColors.primeColor,
      appBar: const AppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RxViewer(
              rxFuture: fileController.getFileState,
              child: () => GridView.builder(
                  itemCount: fileController.getFileState.result.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: Get.width / Get.height * 1.7,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return FileWidget(
                      fileModel: fileController.getFileState.result[index],
                    );
                  })
              // ListView.builder(
              //   itemCount: fileController.getFileState.result.length,
              //   itemBuilder: (BuildContext context, index) {
              //     return FileWidget();
              //   },
              // ),
              ),
          Obx(() {
            return fileController.addAppointmentModel.value.fileIds.isNotEmpty
                ? ButtonWidget(
                    isLoading: fileController.addAppointmentState.loading,
                    title: "حجز",
                    onTap: () {
                      log("message");
                      fileController.addAppointment();
                    },
                    width: Get.width * .5,
                    color: Colors.blue,
                  ).paddingSymmetric(vertical: 10)
                : Container();
          })
        ],
      ),
    );
  }

  void addFileDialog() {
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
                  fileController.addFileModel.value.name = value;
                },
                keyboardType: TextInputType.name,
                hint: "الاسم",
                validate: (value) {
                  return null;
                },
              ),
              ButtonWidget(
                  title: "اختر ملف",
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

                    if (result != null) {
                      // This is the path of the selected PDF file
                      String filePath = result.files.single.path!;
                      fileController.addFileModel.value.file = File(result.files.single.path!);
                      // Do something with the file path
                    }
                  }).paddingSymmetric(vertical: 4),
              Obx(() {
                return ButtonWidget(
                    isLoading: fileController.addFileState.loading,
                    title: "إضافة",
                    onTap: () {
                      fileController.addFileModel.value.groupId = groupId;
                      fileController.addFile();
                    });
              })
            ],
          ),
        ));
  }
}
