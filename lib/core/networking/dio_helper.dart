// import 'dart:math'; // Removed because log from dart:math is not for logging
import 'package:books_app/core/networking/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  late Dio dio;

  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.add(PrettyDioLogger());
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(endPoint, queryParameters: query);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
