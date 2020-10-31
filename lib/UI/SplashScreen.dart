import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_garment_shop/UI/Dashbord.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Dashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Color(0xffDD2C0D),
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
