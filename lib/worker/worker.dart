/*import 'dart:convert';
import 'package:http_multi_server/http_multi_server.dart';

import '../main.dart';


class worker {
  String location;

  //constructor
  worker({this.location}){
    location=this.location;
  }

  String temp;
  String humidity;
  String air_speed;
  String description;
  String main;


  Future<void> getData()async{

    Response response= await get("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=071e41d6397aa1334d90ea4050c9fbe3");
    Map data= jsonEncode(response.body);



    //Getting temp ,Humidity
    Map temp_data=data["main"];
    double get_humidity=temp_data["humidity"];
    double get_tamp=temp_data["temp"];

    //getting ari_speed
    Map wind=data["wind"];
    double get_air_speed=wind["speed"];

    //getting description
    List weather_data=data["weateher"];
    Map weather_main_data=weather_data[0];
    String get_main_des=weather_main_data["main"];
    String get_desc=weather_main_data["description"];


    //assigning values
    temp=get_tamp.toString();
    humidity=get_humidity.toString();
    air_speed=get_air_speed.toString();
    description=get_desc;
    main=get_main_des;





  }





}*/