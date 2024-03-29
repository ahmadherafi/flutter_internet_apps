import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/constant/const.dart';
import 'package:flutter_internet_apps/common/widgets/appbar.dart';
import 'package:flutter_internet_apps/common/widgets/rx_veiwer.dart';
import 'package:flutter_internet_apps/features/file/business_logic_layer/file_controller.dart';
import 'package:flutter_internet_apps/features/file/presentation_layer/widgets/my_appointment.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class MyAppointmentScreen extends StatelessWidget {
  FileController fileController = Get.find<FileController>();
  MyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    fileController.myAppointment();
    return Scaffold(
      backgroundColor: AppColors.primeColor,
      appBar: const AppBarWidget(),
      body: RxViewer(
        rxFuture: fileController.myAppointmentState,
        child: () => GridView.builder(
          itemCount: fileController.myAppointmentState.result.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: Get.width / Get.height * 2,
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, index) {
            return MyAppointmentWidget(
              model: fileController.myAppointmentState.result[index],
            );
          },
        ),
      ),
    );
  }
}
