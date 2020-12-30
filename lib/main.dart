import 'package:flutter/material.dart';
import 'package:online_garment_shop/UI/Cart.dart';
import 'package:online_garment_shop/UI/ChangePassword.dart';
import 'package:online_garment_shop/UI/Checkout.dart';
import 'package:online_garment_shop/UI/Dashbord.dart';
import 'package:online_garment_shop/UI/ForgotPassword.dart';
import 'package:online_garment_shop/UI/OrderDetails.dart';
import 'package:online_garment_shop/UI/ProductDetail.dart';
import 'package:online_garment_shop/UI/SignIn.dart';
import 'package:online_garment_shop/UI/SignUp.dart';
import 'package:online_garment_shop/UI/SplashScreen.dart';
import 'package:online_garment_shop/UI/SubCategory.dart';
import 'package:online_garment_shop/UI/UpdateProfile.dart';

import 'UI/Payments.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xffBB2C0D)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SubCategory(1),
    );
  }
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
