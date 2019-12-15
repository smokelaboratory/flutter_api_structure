import 'package:api_structure/api/api_error.dart';
import 'package:api_structure/base/base_repo.dart';
import 'package:api_structure/obervable.dart';

class HomeRepo extends BaseRepo {
  Observable<String> loginState = Observable();

  dynamic getData(Observable<ApiError> onApiError) async {
    return await callApi(() {
      return apiService.getData();
    }, onApiError, reqCode: 240);
  }
}
