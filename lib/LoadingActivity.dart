import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheather_forecast/HomeActivity.dart';


class LoadingActivity extends StatefulWidget{
  const LoadingActivity({super.key});

  @override
  State<StatefulWidget> createState(){
    return LoadingActivityState();
  }
}
class LoadingActivityState extends State<LoadingActivity>{

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomeActivity();
      }));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue[100],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.lightBlue,
                backgroundImage: AssetImage("assets/images/wheather.jpg"),
                radius: 70,
              ),
              Padding(
                padding: EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Text("Wheather",style: TextStyle(fontSize: 38,fontWeight: FontWeight.w900,),),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Forecast",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                    ),
                  ],

                ),
              ),

              Text("Developed By Shadab",style: TextStyle(fontWeight: FontWeight.w900),),


              Padding(
                padding: EdgeInsets.all(30),
                child: SpinKitWaveSpinner(
                  size: 80,
                  color: Colors.lightBlue,
                ),
              ),



            ],


          ),

        ),
      ),
    );
  }
}