import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_internet_apps/core/local_storage/local_storage.dart';

import '../network/dio.dart';

import "../errors/custom_exception.dart";
import '../utils/utils.dart';

enum RequestMethod { get, post, delete, put, patch }

class Request {
  final String endPoint;
  final bool authorized;
  final bool isFormData;
  final bool removeMockMatch;
  final RequestMethod method;
  Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queryParams;
  String? savePath;
  void Function(int, int)? onReceiveProgress;
  // int? receiveTimeout;

  Request(
    this.endPoint,
    this.method, {
    this.authorized = false,
    this.removeMockMatch = false,
    this.isFormData = false, // TODO: formData should be handled in different way.
    this.headers,
    this.body,
    this.queryParams,
    this.savePath,
    this.onReceiveProgress,
    // this.receiveTimeout,
  }) {
    if (authorized) {
      // AuthController authController = stateGet.Get.find<AuthController>();
      LocalStorage local = LocalStorage();
      log('my toooken : ${local.getToken()}');
      headers = {
        "Authorization": "Bearer " '${local.getToken()}',
      };
    }

    if (isFormData) {
      log('im form data');
      FormData f = FormData.fromMap(body!);
      for (var pair in f.fields) {
        log('${pair.key}/${pair.value}');
      }
    }
  }

  Future<Map<String, dynamic>> sendRequest() async {
    Response? response;
    try {
      response = await DioInstance().dio.request(
            endPoint,
            queryParameters: queryParams,
            data: isFormData ? FormData.fromMap(body!) : body,
            options: Options(
              method: Utils.requestTypeToString(method),
              headers: headers,
              // contentType: 'application/json',
            ),
          );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        //TODO: this should be handled in different way.
        if (response.data is String) return json.decode(response.data);
        return response.data;
      }
    } on DioError catch (error) {
      // handling http status code exceptions
      if (error.type == DioErrorType.badResponse) {
        // handling bad requests.
        if (error.response!.statusCode == 400) {
          // this line is really depends on what server responds, and how it reply with errors.
          throw badRequestException[error.response!.data["error"]] ??
              GenericException(
                type: ExceptionType.Other,
              );
        }

        // handling other status codes.
        throw statusCodesException[error.response!.statusCode] ??
            GenericException(
              type: ExceptionType.Other,
            );
      }

      // handling connection problems.
      if (error.type == DioErrorType.connectionTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.unknown) {
        throw GenericException(
          type: ExceptionType.ConnectionError,
          errorMessage: "You Have no Internet Connection",
        );
      }
    }
    return {};
  }

  Future<void> downloadRequest() async {
    Response? response;
    try {
      response = await DioInstance().dio.download(
            endPoint,
            savePath,
            data: body,
            queryParameters: queryParams,
            onReceiveProgress: onReceiveProgress,
            options: Options(
              method: method.name.toUpperCase(),
              headers: headers,
              contentType: 'application/json',
              // receiveTimeout: receiveTimeout,
            ),
          );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        //TODO: this should be handled in diffren way.
        // if (response.data is String) return json.decode(response.data);
        
        // return response.data;
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        // handling bad requests.
        if (error.response!.statusCode == 400) {
          // this line is really depends on what server responds, and how it reply with errors.
          throw badRequestException[error.response!.data["error"]] ??
               GenericException(
                type: ExceptionType.Other,
              );
        }

        // handling other status codes.
        throw statusCodesException[error.response!.statusCode] ??
             GenericException(
              type: ExceptionType.Other,
            );
      }
      // handling connection problems.
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.unknown) {
       
        throw GenericException(
          type: ExceptionType.ConnectionError,
          errorMessage: 'no_internet_connection',
        );
      }
    }
    // return {};
  }
}
