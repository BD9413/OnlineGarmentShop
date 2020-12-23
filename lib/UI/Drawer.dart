import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_garment_shop/UI/ChangePassword.dart';
import 'package:online_garment_shop/UI/Orders.dart';
import 'package:online_garment_shop/UI/UserProfile.dart';

import 'Product.dart';

class DashboardDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardDrawerState();
  }
}

class DashboardDrawerState extends State<DashboardDrawer> {
  bool isAnnonymous = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                        child: Icon(
                          Icons.home,
                          color: Colors.black54,
                        ),
                      ),
                      Expanded(
                        child: Text("Home",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'GoogleSans',
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                height: 50.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.widgets,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                        child: Text(
                            "Category",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'GoogleSans',
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Product()));
              },
              child: Container(
                height: 50.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.wc,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                        child: Text("Product",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'GoogleSans',
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isAnnonymous ? false : true,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Orders()));
                },
                child: Container(
                  height: 50.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.assignment,
                            color: Colors.black54,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                          child: Text(
                              "My Orders",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'GoogleSans',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
              },
              child: Container(
                height: 50.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                        child: Text("Profile",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'GoogleSans',
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
                visible: isAnnonymous ? false : true,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassWord()));
                  },
                  child: Container(
                    height: 50.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.vpn_key,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "Change Password",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'GoogleSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            !isAnnonymous
                ? InkWell(
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (s) {
                      //       return Logout();
                      //     });
                    },
                    child: Container(
                      height: 50.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.lock_open,
                                color: Colors.black54,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Logout",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'GoogleSans',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
