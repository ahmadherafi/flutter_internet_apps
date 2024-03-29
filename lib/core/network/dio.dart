import 'package:dio/dio.dart';

class DioInstance {
  Dio? _dio;

  Dio get dio => _dio ?? _instantiate();

  Dio _instantiate() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://172.20.10.5:8000/api/",
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        responseHeader: false,
        requestHeader: false,
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  }
}
