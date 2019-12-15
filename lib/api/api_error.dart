import 'package:dio/dio.dart';

class ApiError {
  DioError dioError;
  int reqCode;

  ApiError(this.dioError, this.reqCode);
}
