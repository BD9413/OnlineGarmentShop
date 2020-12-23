import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:online_garment_shop/Configration/APICalls.dart';
import 'package:online_garment_shop/Configration/APIUrls.dart';
import 'package:online_garment_shop/Models/SignUpResponseModel.dart';
import 'package:online_garment_shop/UI/Dashbord.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
enum LoginStatus { notSignIn, signIn }
class _SignUpState extends State<SignUp> {

  LoginStatus _loginStatus = LoginStatus.notSignIn;
  final GlobalKey<FormState> _key = new GlobalKey();
  final TextEditingController _userNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _validate = false;
  String userName, email, password, mobile, address;

  int _radioValue = 0;
  String gender;

  bool isObscureText = true;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          gender = "male";
          break;
        case 1:
          gender = "female";
          break;
      }
      print(gender);
    });
  }

  @override
  void dispose() {
    if (this.mounted) super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: _key,
        autovalidate: _validate,
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
                    "SIGN UP",
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _userNameController,
                            validator: validateUsername,
                            decoration: InputDecoration(
                              labelText: "Name",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (str) {
                              userName = str;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _emailController,
                            validator: validateEmail,
                            decoration: InputDecoration(
                              labelText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (str) {
                              email = str;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _mobileController,
                            validator: validateMobile,
                            decoration: InputDecoration(
                              labelText: "Mobile No",
                            ),
                            keyboardType: TextInputType.number,
                            onSaved: (str) {
                              mobile = str;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Gender:  ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            new Radio(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text('Male'),
                            new Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text('Female'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: isObscureText,
                            controller: _passwordController,
                            validator: validatePassword,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                icon: Icon(
                                  isObscureText ? Icons.visibility_off : Icons.visibility,
                                  color: Color(0xffBB2C0D
                                  ),
                                ),
                              )
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (str) {
                              password = str;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLines: 3,
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: "Address",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (str) {
                              address = str;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:20, left: 20, right: 20,bottom: 10),
                          child: Container(
                            width: double.maxFinite,
                            child: RaisedButton(
                              onPressed: () {
                                _sendToServer(userName, email, mobile, gender, password, address);
                              },
                              color: Color(0xffBB2C0D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
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
    );
  }
  _sendToServer(String userName, String email, String mobile, String gender, String password, String address) {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      login();
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  login() async {
    final response = await http.post(APIUrls.signUp, body: {
      "user_name": userName,
      "user_email": email,
      "user_password": mobile,
      "user_gender":gender != null ? gender : "male",
      "user_mobile":password,
      "user_address":address != null ? address : "",
    });

    final data = jsonDecode(response.body);
    int flag = data['flag'];
    int uid = data['uid'];
    String uname = data['uname'];
    String message = data['message'];

    if (flag == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(flag, uid, uname, message);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
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

  savePref(int flag, int uid, String uname, String message) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("flag", flag);
      preferences.setString("name", uname);
      preferences.setString("uid", uid.toString());
      preferences.setString("message", message);
      preferences.commit();
    });
  }


  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.replaceAll(" ", "").isEmpty) {
      return 'Mobile is required';
    } else if (value.replaceAll(" ", "").length != 10) {
      return 'Mobile number must 10 digits';
    } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
      return 'Mobile number must be digits';
    }
    return null;
  }

  String validateUsername(String value) {
    if (value.isEmpty) {
      return 'Username is required';
    }
    return null;
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

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

}
