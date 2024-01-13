import 'dart:developer';
import 'dart:io' as io;

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/button.dart';
import 'package:flutter_internet_apps/common/widgets/loader.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:flutter_internet_apps/features/file/business_logic_layer/file_controller.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/file.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class FileWidget extends StatelessWidget {
  final FileModel fileModel;
  FileController fileController = Get.find<FileController>();
  FileWidget({
    super.key,
    required this.fileModel,
  });

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<bool>(
        initialValue: false,
        builder: (bool? value, toggle) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: value! ? Colors.red : Colors.white)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      fileModel.user.name,
                      color: Colors.black,
                    ),
                    PopupMenuButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: const TextWidget("حذف", color: Colors.black),
                          onTap: () {
                            fileController.deleteFile(
                              fileModel.id,
                              onSuccess: (p0) {
                                fileController.getFile(fileModel.groupId);
                              },
                            );
                            // groupController.deleteGroup(groupModel.id);
                          },
                        ),
                        PopupMenuItem(
                          child: Obx(() {
                            return fileController.downloadFileState.loading
                                ? const LoaderWidget(
                                    color: Colors.red,
                                  )
                                : const TextWidget("تحميل", color: Colors.black);
                          }),
                          onTap: () {
                            fileController.downloadFile(fileModel.id);
                            // Dio().download(urlPath, savePath);
                          },
                        ),
                        // fileModel.status == "check_in"
                        //     ?
                        PopupMenuItem(
                          child: const TextWidget("تعديل", color: Colors.black),
                          onTap: () {
                            if (fileModel.status == "check_out") {
                              Get.snackbar("", "يجب ان يكون الملف محجوز مسبقاً");
                              return;
                            }
                            updateFileDialog();
                            // getUserDialog();
                            // groupController.getUserForGroup(groupModel.id);
                          },
                        )
                        // : PopupMenuItem(child: Container()),
                      ],
                    )
                  ],
                ),
                TextWidget(
                  fileModel.createdAt,
                  color: Colors.black,
                ),
                Container(
                  width: 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/pdf.png").center(),
                ),
                // const Icon(
                //   Icons.picture_as_pdf_sharp,
                //   size: 60,
                // ).center(),
                TextWidget(
                  fileModel.name,
                  color: Colors.black,
                ),
              ],
            ),
          ).onTap(() {
            log("message");
            if (value) {
              toggle(!value);
              fileController.addAppointmentModel.value.fileIds.remove(fileModel.id);
              fileController.addAppointmentModel.update((val) {});
            }
          }).onLongPress(() {
            toggle(!value);
            fileController.addAppointmentModel.value.fileIds.add(fileModel.id);
            fileController.addAppointmentModel.update((val) {});
          });
        });
  }

  void updateFileDialog() {
    Get.defaultDialog(
        title: "",
        middleText: "",
        backgroundColor: Colors.white,
        content: Container(
          height: Get.height * .3,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                  title: "اختر ملف",
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

                    if (result != null) {
                      // This is the path of the selected PDF file
                      String filePath = result.files.single.path!;
                      fileController.file = io.File(result.files.single.path!);
                      // Do something with the file path
                    }
                  }).paddingSymmetric(vertical: 4),
              Obx(() {
                return ButtonWidget(
                    isLoading: fileController.updateFileState.loading,
                    title: "تعديل",
                    onTap: () {
                      fileController.updateFile(
                        fileModel.id,
                        onSuccess: (p0) {
                          fileController.getFile(fileModel.groupId);
                          RoutingManager.back();
                        },
                      );
                      // fileController.addFileModel.value.groupId = groupId;
                      // fileController.addFile();
                    });
              })
            ],
          ),
        ));
  }
}
