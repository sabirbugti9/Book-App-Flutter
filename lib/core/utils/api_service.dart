import 'package:dio/dio.dart';

class APIService {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  APIService(this._dio);

  Future<Map<String, dynamic>> get(String url) async {
    return await _dio.get(_baseUrl + url).then((value) => value.data);
  }
}
