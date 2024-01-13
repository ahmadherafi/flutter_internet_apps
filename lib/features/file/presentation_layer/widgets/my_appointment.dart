import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/features/file/business_logic_layer/file_controller.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/my_appointment.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class MyAppointmentWidget extends StatelessWidget {
  MyAppointmentModel model;
  FileController fileController = Get.find<FileController>();
  MyAppointmentWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                model.file.name,
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
                      fileController.deleteAppointment(model.id);
                      // groupController.deleteGroup(groupModel.id);
                    },
                  ),
                ],
              )
            ],
          ),
          Container(
            width: 200,
            height: 100,
            alignment: Alignment.center,
            child: Image.asset("assets/images/pdf.png"),
          ),
        ],
      ),
    );
  }
}
