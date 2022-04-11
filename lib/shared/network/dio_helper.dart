import 'package:breaking_bad_app/shared/constants/strings.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    ));
  }

  static Future<Response> getData(
      {String? lang = 'en',
      String? token,
      required String path,
      Map<String, dynamic>? query}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token
    };
    return await dio.get(path, queryParameters: query);
  }

  static Future<Response> postData(
      {String? lang = 'en',
      String? token,
      Map<String, dynamic>? query,
      required String path,
      required Map<String, dynamic> data}) async {
    dio.options.headers = {
      //هنا لو اتنفذ الاوبشن ده بيلغي عمل الheaders اللي فوق عشان كدا ببعت content type جديد
      'Content-Type': 'application/x-www-form-urlencoded',
      'lang': lang,
      'Authorization': token
    };
    return dio.post(path, queryParameters: query, data: data);
  }

  static Future<Response> updateData(
      {String? lang = 'en',
      String? token,
      Map<String, dynamic>? query,
      required String path,
      required Map<String, dynamic> data}) async {
    dio.options.headers = {
      //هنا لو اتنفذ الاوبشن ده بيلغي عمل الheaders اللي فوق عشان كدا ببعت content type جديد
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token
    };
    return dio.put(path, queryParameters: query, data: data);
  }
}
