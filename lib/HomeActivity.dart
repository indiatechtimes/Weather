import 'dart:convert';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



import 'package:flutter/material.dart';
import 'package:http_multi_server/http_multi_server.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeActivityState();
  }
}

class HomeActivityState extends State<HomeActivity> {






  void getData() async {
    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Varanasi&appid=071e41d6397aa1334d90ea4050c9fbe3");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Print the raw response body to check for unexpected text
        print('Raw response body: ${response.body}');

        // Decode the response body
        Map<String, dynamic> data = jsonDecode(response.body);

        // Print the entire data to see its structure
        print(data);

        // Attempt to print the "date" field, if it exists
        if (data.containsKey("date")) {
          print(data["date"]);
        } else {
          print("The key 'date' does not exist in the response.");
        }
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Failed to fetch data: $e");
    }
  }








  @override
  void initState() {
    super.initState();
    print("This is initState");
    getData();

  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("This is setState");
  }

  @override
  void dispose(){
    super.dispose();
    print("this is dispose metheod");


  }

  @override
  Widget build(BuildContext context) {
    var City_Name = [
      "Mumbai",
      "Delhi",
      "Indore",
      "Chennai",
      "Varanasi",
      "Ghazipur",
      "Bangalore",
      "Hyderabad",
      "Kolkata",
    ];

    return Scaffold(

      resizeToAvoidBottomInset: false,
      /*appBar: PreferredSize(// THIS IS GENERAL WAY TO ADD COLOR IN Status BAR , THIS PROVIDE SOLID COLOR TO YOOUR Status Bar
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),*/


      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          gradient: const LinearGradient(
            colors: [
              Colors.red,
              Colors.cyan,
            ]
          ),
        ),
      ),
      body: SafeArea(



        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              /*stops: [//to control the gradiant
                0.1,
                0.5,
              ],*/
              colors: [
                Colors.lightBlue,
                Colors.pink,
              ],
            ),
          ),
          child: Column(
            // main column
            children: <Widget>[
              Container(
                height: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),


                child: const Row(
                  children: <Widget>[


                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search, color: Colors.black),
                    ),

                    Expanded(
                      child: TextField(

                        decoration: InputDecoration(
                          hintText: "Search Your City",
                          border: InputBorder.none,
                        ),


                      ),
                    ),

                  ],
                ),
              ),



              Row(
                children: [
                  Expanded(
                    child: Container(

                      padding: EdgeInsets.all(26),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          //Image.network(),
                          const Column(
                            children: [
                              Text("Scattered Clouds",style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 17
                              ),),
                              Text("In Ghazipur",style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),




              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(100),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Icon(WeatherIcons.thermometer,size: 50,),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("TEMPERATURE",style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),),
                          ),
                          Row(
                            children: [
                              Text("44",style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.bold,

                              ),),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("C",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                  ),
                ],
              ),




              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.windy,size: 30,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("WIND SPEED",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700
                                ),),
                              ),
                            ],
                          ),

                          Text("20.0",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900
                          ),),
                          Text("Km/hr",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900
                          ),),
                        ],
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.windy,size: 30,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("WIND SPEED",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                ),),
                              ),
                            ],
                          ),

                          Text("20.0",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),),
                          Text("Km/hr",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),),
                        ],
                      ),


                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.windy,size: 30,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("WIND SPEED",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                ),),
                              ),
                            ],
                          ),

                          Text("20.0",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),),
                          Text("Km/hr",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),),
                        ],
                      ),


                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.windy,size: 30,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("WIND SPEED",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                ),),
                              ),
                            ],
                          ),

                          Text("20.0",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),),
                          Text("Km/hr",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),),
                        ],
                      ),


                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.windy,size: 30,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("WIND SPEED",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                ),),
                              ),
                            ],
                          ),

                          Text("20.0",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),),
                          Text("Km/hr",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),),
                        ],
                      ),

                    ),
                  ],
                ),
              ),








              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Developed By Shadab"),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("DATA PROVIDED BY OPENWHEATHER MAP.ORG"),
              ),




            ],



          ),
        ),
      ),
    );
  }
}
