import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../main.dart';

@singleton
class Network {
  static Network? _network;
  Network._();
  factory Network() {
    init();

    _network ??= Network._();
    return _network!;
  }

  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https://ecommerce.routemisr.com",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: {
            if (prefs.getString("token") != null)
              "token": prefs.getString("token") ?? ""
          },
          connectTimeout: const Duration(seconds: 5)),
    );
    dio.interceptors.add(PrettyDioLogger());
  }

  Future<Response> post(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    return dio.post(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> get(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    return dio.get(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> put({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}
