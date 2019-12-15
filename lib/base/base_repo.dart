import 'package:api_structure/api/api_error.dart';
import 'package:api_structure/api/api_util.dart';
import 'package:api_structure/obervable.dart';
import 'package:get_it/get_it.dart';

class BaseRepo {
  final ApiUtil apiService = GetIt.I<ApiUtil>();

  dynamic callApi(
      Future<dynamic> Function() apiBlock, Observable<ApiError> onApiError,
      {int reqCode = -1}) async {
    return await apiBlock().catchError((error) {
      onApiError.setValue(ApiError(error, reqCode));
      return null;
    });
  }
}
