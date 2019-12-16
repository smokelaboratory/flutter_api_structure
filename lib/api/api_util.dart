import 'package:dio/dio.dart';
import 'api_connector.dart';

class ApiUtil {
  ApiConnector _apiConnector;

  ApiUtil() {
    _apiConnector = ApiConnector();
  }

  void cancelRequests({CancelToken cancelToken}) {
    _apiConnector.cancelRequests(cancelToken: cancelToken);
  }

  dynamic getData() async {
    return (await _apiConnector.get("/todos/1")).data;
  }
}