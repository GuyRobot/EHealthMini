import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ChatbotsApi {
  static const String BASE_URL = "http://10.0.2.2:5005/";

  static getInstance() {}

  static Dio buildDio({String base = BASE_URL}) {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: base,
      );

    dio.interceptors.addAll([
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
    ]);

    return dio;
  }
}
