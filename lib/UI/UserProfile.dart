import 'dart:ui';

import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBB2C0D),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("User Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.person_add_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xffBB2C0D),
                      child: Text(
                        "B",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      minRadius: 45,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Bhaumik",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xffBB2C0D)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xffBB2C0D)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "xyz@gmail.com",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xffBB2C0D)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Mobile",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "8758462536",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xffBB2C0D)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              Text(
                                "Paldi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xffBB2C0D)),
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
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
}
