import 'package:flutter/material.dart';

class ChangePassWord extends StatefulWidget {
  @override
  _ChangePassWordState createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {

  final GlobalKey<FormState> _key = new GlobalKey();
  final TextEditingController _oldPasswordController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController =
  new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _validate = false;
  String oldPassword, password, confirmPassword;

  bool isObscureOld = true;
  bool isObscureNew = true;
  bool isObscureConfirm = true;

  @override
  void dispose() {
    if (this.mounted) super.dispose();
    _oldPasswordController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xffBB2C0D),
        title: Text("Change Password"),
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Text(
                    "CHANGE PASSWORD",
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
                            obscureText: isObscureOld,
                            controller: _oldPasswordController,
                            validator: validateOldPassword,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (str) {
                              oldPassword = str;
                            },
                            decoration: InputDecoration(
                                labelText: "Old Password",
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      isObscureOld = !isObscureOld;
                                    });
                                  },
                                  icon: Icon(
                                    isObscureOld ? Icons.visibility_off : Icons.visibility,
                                    color: Color(0xffBB2C0D
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: isObscureNew,
                            controller: _passwordController,
                            validator: validatePassword,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (str) {
                              password = str;
                            },
                            decoration: InputDecoration(
                                labelText: "New Password",
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      isObscureNew = !isObscureNew;
                                    });
                                  },
                                  icon: Icon(
                                    isObscureNew ? Icons.visibility_off : Icons.visibility,
                                    color: Color(0xffBB2C0D
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: isObscureConfirm,
                            controller: _confirmPasswordController,
                            validator: validateConfirmPassword,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (str) {
                              confirmPassword = str;
                            },
                            decoration: InputDecoration(
                                labelText: "Confirm Password",
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      isObscureConfirm = !isObscureConfirm;
                                    });
                                  },
                                  icon: Icon(
                                    isObscureConfirm ? Icons.visibility_off : Icons.visibility,
                                    color: Color(0xffBB2C0D
                                    ),
                                  ),
                                )
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
                                "Submit",
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
    );
  }
  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  String validateOldPassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  String validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

}
