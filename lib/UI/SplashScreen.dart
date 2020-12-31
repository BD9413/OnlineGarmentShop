import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_garment_shop/UI/Dashbord.dart';
import 'package:online_garment_shop/UI/SignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int loginFlag = 0;
  int registerFlag = 0;
  String loginMessage = "";
  String registerMessage = "";
  String registerName = "";


  getUserValuesSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    loginFlag = prefs.getInt('loginFlag');
    registerFlag = prefs.getInt('registerFlag');
    loginMessage = prefs.getString('loginMessage');
    registerMessage = prefs.getString('registerMessage');
    registerName = prefs.getString('registerName');
    navigationFunc();
  }

  navigationFunc() {
    if(loginFlag == 1 || registerFlag == 1 && registerName != null) {
      Timer(
          Duration(seconds: 2),
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Dashboard())));
    } else
      Timer(
          Duration(seconds: 2),
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => SignIn())));
  }
  @override
  void initState() {
    getUserValuesSP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Color(0xffBB2C0D),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Assets/ic_splash_icon.png",
              width: 280,
              height: 280,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Online Garment Shop",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
