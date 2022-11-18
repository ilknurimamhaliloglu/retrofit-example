import 'dart:io';

import 'package:dio/dio.dart';

abstract class Exceptions {
  final String message;

  Exceptions(this.message);
}

class ServerException extends Exceptions implements Exception {
  ServerException(String message) : super(message);

  static Exception returnDioResponse(DioError dioError) {
    // dioError.response.statusCode
    try {
      if (dioError.error.runtimeType == SocketException &&
          dioError.type == DioErrorType.other) {
        return SocketException(dioError.message);
      } else {
        return ServerException(
          dioError.message,
        );
      }
    } catch (e) {
      return ServerException('Something went wrong');
    }
  }
}
