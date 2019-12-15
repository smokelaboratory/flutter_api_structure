import 'package:api_structure/api/api_util.dart';
import 'package:api_structure/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  
  GetIt.instance.registerLazySingleton(() => ApiUtil());

  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}