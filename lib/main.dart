import 'package:flutter/material.dart';
import 'LoadingActivity.dart';
import 'HomeActivity.dart';
import 'LoadingActivity.dart';
import 'package:http_multi_server/http_multi_server.dart';
import 'package:http/http.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My_weather_forecast_app",
      home: LoadingActivity(),
    );
  }
}


