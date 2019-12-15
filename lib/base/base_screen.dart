import 'package:api_structure/api/api_error.dart';
import 'package:api_structure/api/api_util.dart';
import 'package:api_structure/obervable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// A parent class for all the stateful widgets

abstract class BaseScreen extends StatefulWidget {}

abstract class BaseScreenState<T extends BaseScreen> extends State<T> {
  ApiUtil apiService = GetIt.I<ApiUtil>();

  Observable<ApiError> onApiError();

  @override
  void initState() {
    super.initState();

    onApiError()?.observe((apiError) {
      errorToast(message: apiError.reqCode.toString());
    });
  }

  void successToast({@required String message}) {
    
  }

  void errorToast({@required String message}) {
    
  }

  @override
  void dispose() {
    apiService.cancelRequests();

    super.dispose();
  }
}
