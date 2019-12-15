import 'package:api_structure/api/api_error.dart';
import 'package:api_structure/base/base_screen.dart';
import 'package:api_structure/obervable.dart';
import 'package:api_structure/screen/home/home_model.dart';
import 'package:flutter/material.dart';

class Home extends BaseScreen {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BaseScreenState<Home> {
  HomeModel model;

  String text = "";

  @override
  void initState() {
    model = HomeModel();

    model.apiDataObservable.observe((apiData) {
      setState(() {
        text = apiData;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () {
                model.getApiData();
              },
              child: Text("Call API"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Observable<ApiError> onApiError() {
    return model.onApiError;
  }
}
