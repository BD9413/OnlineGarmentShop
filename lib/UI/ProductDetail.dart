import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_garment_shop/Models/ProductModel.dart';
import 'package:online_garment_shop/Models/SignInResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  final Products products;
  ProductDetail({this.products});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Products _products;

  String registerUid = "";
  String loginUid = "";
  Userdata _userdata;
  var user;

  getUserValuesSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    registerUid = prefs.getString('registerUid');
    user = prefs.getString('userData');
    _userdata = Userdata.fromJson(jsonDecode(user));
    loginUid = _userdata.userId;
  }

  @override
  void initState() {
    getUserValuesSP();
    _products = widget.products;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBB2C0D),
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                height: 230,
                width: double.maxFinite,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              _products.productImage,
                            ))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _products.productName,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _products.productPrice,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffBB2C0D),
                                fontWeight: FontWeight.w800),
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            color: Colors.grey[500],
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                hoverColor: Color(0xffBB2C0D),
                                focusColor: Color(0xffBB2C0D),
                              ),
                              cursorColor: Color(0xffBB2C0D),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Color(0xffBB2C0D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "UPDATE",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Description",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:20.0, right: 20),
              child: Text(
                _products.productDetails,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
