
import 'package:api_structure/base/base_model.dart';
import 'package:api_structure/obervable.dart';
import 'package:api_structure/screen/home/home_repo.dart';

class HomeModel extends BaseModel {
  Observable<String> apiDataObservable = Observable();
  HomeRepo repo = HomeRepo();

  void getApiData() async {
    apiDataObservable.setValue((await repo.getData(onApiError))?.toString());
  }
}
