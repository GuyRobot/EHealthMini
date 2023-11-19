import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ServersApi {
  static const String BASE_URL = "http://10.0.2.2:9000/";
  static const String USER_ID = "105664380703216036303";
  static const String API_KEY = "AIzaSyAwcSti2gPhjeCsoGaIybzDwowmTLzsDkY";

  static getInstance() {}

  static Dio buildDio({String base = BASE_URL}) {
    final dio = Dio()
      ..options = BaseOptions(
          baseUrl: base,
          queryParameters: <String, dynamic>{r'key': ServersApi.API_KEY});

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

  static Dio buildAuthDio(String token, {String base = BASE_URL}) {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: base,
        queryParameters: <String, dynamic>{r'key': ServersApi.API_KEY},
        headers: <String, dynamic>{
          r'Authorization': "Bearer ${token}",
          "x-access-token": token,
        },
      );

    dio.interceptors.addAll([
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90),
    ]);

    return dio;
  }
}
