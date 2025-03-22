import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromResponse(int? statusCode, String? errMessage) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: errMessage ?? 'Bad Request');
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: errMessage ?? 'Not Found');
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: errMessage ?? 'Internal Server Error');
    } else {
      return ServerFailure(errMessage: errMessage ?? 'Opps There was an Error');
    }
  }

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection Timeout With API Server!');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send Timeout With API Server!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive Timeout With API Server!');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate With API Server!');
      case DioExceptionType.badResponse:
        return ServerFailure(errMessage: 'Bad Response With API Server!');
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request Canceled With API Server!');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'Connection Error With API Server!');
      case DioExceptionType.unknown:
        if (dioException.response != null) {
          return ServerFailure.fromResponse(dioException.response?.statusCode,
              dioException.response?.statusMessage);
        }
        return ServerFailure(errMessage: 'Unknown Error With API Server!');
    }
  }
}
