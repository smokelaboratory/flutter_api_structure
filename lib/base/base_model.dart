import 'package:api_structure/api/api_error.dart';
import 'package:api_structure/obervable.dart';

class BaseModel {
  Observable<ApiError> onApiError = Observable();
}
