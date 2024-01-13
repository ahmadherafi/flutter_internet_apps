import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_internet_apps/core/api/end_point.dart';
import 'package:flutter_internet_apps/core/network/http.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/add_appointment.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/add_file.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/file.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/my_appointment.dart' as appointment;
import 'package:flutter_internet_apps/features/file/data_layer/models/report.dart';

class FileService {
  Future<List<FileModel>> getFile(int groupId) async {
    Request request = Request(
      EndPoint.getFile(groupId),
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();

    return FileModel.fromJsonList(response);
  }

  Future<void> addFile(AddFileModel addFileModel) async {
    Request request = Request(
      EndPoint.addFile,
      RequestMethod.post,
      authorized: true,
      body: addFileModel.toJson(),
      isFormData: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<void> deleteFile(int fileId) async {
    Request request = Request(
      EndPoint.deleteFile(fileId),
      RequestMethod.delete,
      authorized: true,
    );

    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<void> downloadFile(
    int fileId,
    String savePath,
  ) async {
    Request request = Request(EndPoint.downloadFile(fileId), RequestMethod.get, authorized: true, savePath: savePath);

    await request.downloadRequest();
  }

  Future<void> updateFile(int fileId, File file) async {
    Request request = Request(
      EndPoint.updateFile(fileId),
      RequestMethod.post,
      authorized: true,
      isFormData: true,
      body: {
        'link': MultipartFile.fromFileSync(file.path),
      },
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<void> appointmentFiles(AddAppointmentModel addAppointmentModel) async {
    Request request = Request(
      EndPoint.appointmentFiles,
      RequestMethod.post,
      authorized: true,
      body: addAppointmentModel.toJson(),
      isFormData: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<List<appointment.MyAppointmentModel>> myAppointment() async {
    Request request = Request(
      EndPoint.myAppointment,
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();

    return appointment.MyAppointmentModel.fromJsonList(response);
  }

  Future<void> deleteAppointment(int appointmentId) async {
    Request request = Request(
      EndPoint.deleteAppointment(appointmentId),
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<List<ReportModel>> getReport() async {
    Request request = Request(
      EndPoint.getReport,
      RequestMethod.get,
      authorized: true,
    );

    Map<String, dynamic> response = await request.sendRequest();

    return ReportModel.fromJsonList(response);
  }
}
