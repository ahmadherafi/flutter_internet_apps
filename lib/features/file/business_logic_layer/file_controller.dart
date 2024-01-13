import 'dart:io' as io;

import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/add_appointment.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/add_file.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/file.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/my_appointment.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/report.dart';
import 'package:flutter_internet_apps/features/file/data_layer/source/file_service.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rx_future/rx_future.dart';
import 'package:path_provider/path_provider.dart';

class FileController extends GetxController {
  FileService fileService = FileService();
  RxFuture<List<FileModel>> getFileState = RxFuture([]);
  // Directory dir = Directory('/path/to/writable/directory');
  io.Directory? dir;

  Future<void> getFile(int groupId) async {
    await getFileState.observe((p0) async {
      return await fileService.getFile(groupId);
    });
  }

  Rx<AddFileModel> addFileModel = AddFileModel.zero().obs;

  RxFuture<void> addFileState = RxFuture(null);

  Future<void> addFile() async {
    await addFileState.observe(
      (p0) async {
        await fileService.addFile(addFileModel.value);
      },
      onSuccess: (p0) {
        getFile(addFileModel.value.groupId);
        RoutingManager.back();
      },
    );
  }

  RxFuture<void> deleteFileState = RxFuture(null);

  Future<void> deleteFile(int fileId, {void Function(void)? onSuccess}) async {
    await deleteFileState.observe(
      (p0) async {
        await fileService.deleteFile(fileId);
      },
      onSuccess: (p0) {
        onSuccess?.call(p0);
      },
    );
  }

  RxFuture<void> downloadFileState = RxFuture(null);

  Future<void> downloadFile(int fileId) async {
    dir = await getTemporaryDirectory();
    await deleteFileState.observe((p0) async {
      await fileService.downloadFile(fileId, "${dir?.path}/download");
    });
  }

  io.File file = io.File("");
  RxFuture<void> updateFileState = RxFuture(null);

  Future<void> updateFile(int fileId, {void Function(void)? onSuccess}) async {
    await updateFileState.observe(
      (p0) async {
        await fileService.updateFile(fileId, file);
      },
      onSuccess: (p0) {
        onSuccess?.call(p0);
      },
    );
  }

  Rx<AddAppointmentModel> addAppointmentModel = AddAppointmentModel.zero().obs;

  RxFuture<void> addAppointmentState = RxFuture(null);

  Future<void> addAppointment() async {
    await addAppointmentState.observe(
      (p0) async {
        await fileService.appointmentFiles(addAppointmentModel.value);
      },
      onSuccess: (p0) {
        addAppointmentModel.value.fileIds.clear();
      },
    );
  }

  RxFuture<List<MyAppointmentModel>> myAppointmentState = RxFuture([]);

  Future<void> myAppointment() async {
    await myAppointmentState.observe((p0) async {
      return await fileService.myAppointment();
    });
  }

  RxFuture<void> deleteAppointmentState = RxFuture(null);

  Future<void> deleteAppointment(int appointmentId) async {
    await deleteAppointmentState.observe(
      (p0) async {
        await fileService.deleteAppointment(appointmentId);
      },
      onSuccess: (p0) {
        myAppointment();
      },
    );
  }

  RxFuture<List<ReportModel>> reporstState = RxFuture([]);

  Future<void> getReport() async {
    Future.delayed(
      Duration.zero,
      () async {
        await reporstState.observe((p0) async {
          return await fileService.getReport();
        });
      },
    );
  }
}
