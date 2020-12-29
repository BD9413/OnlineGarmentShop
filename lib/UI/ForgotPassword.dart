import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:online_garment_shop/Configration/APIUrls.dart';
import 'package:online_garment_shop/UI/SignIn.dart';

import 'Dashbord.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final GlobalKey<FormState> _key = new GlobalKey();
  final TextEditingController _emailController = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _validate = false;
  String email;

  @override
  void dispose() {
    if (this.mounted) super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Form(
        key: _key,
        autovalidate: _validate,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Image.asset(
                      "Assets/ic_splash_icon.png",
                      width: 150,
                      height: 150,
                      color: Color(0xffBB2C0D),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text(
                      "Online Garment Shop",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xffBB2C0D),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Please enter your email on which you will receive instructions to reset password",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _emailController,
                              validator: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (str) {
                                email = str;
                              },
                              decoration: InputDecoration(
                                labelText: "Email",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20, left: 20, right: 20,bottom: 10),
                            child: Container(
                              width: double.maxFinite,
                              child: RaisedButton(
                                onPressed: () {
                                  _sendToServer();
                                },
                                color: Color(0xffBB2C0D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      forgotPassword();
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  forgotPassword() async {
    final response = await http.post(APIUrls.forgotPassword, body: {
      "user_email": email != null ? email : "",
    });

    final data = jsonDecode(response.body);
    int flag = data['flag'];
    String message = data['message'];

    if (flag == 1) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      });
      print(message);
      registerToast(message);
    } else {
      print("fail");
      print(message);
      registerToast(message);
    }
  }

  registerToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

}
