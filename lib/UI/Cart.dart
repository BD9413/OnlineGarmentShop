import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_garment_shop/Configration/APIUrls.dart';
import 'package:online_garment_shop/Models/CartProductsModel.dart';
import 'package:online_garment_shop/UI/Checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 0;
  String loginUid = "";
  String registerUid = "";
  String uid = "";
  int flag;
  int totalQty;
  int totalPrice;
  String message;
  Future getCartProducts;

  CartApiResponseModel cartApiResponseModel;
  List<CartList> cartList = [];

  getUserValuesSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginUid = prefs.getString('loginUid');
    registerUid = prefs.getString('registerUid');
  }

  String getUid() {
    if (registerUid != null) {
      uid = registerUid;
      return uid;
    } else if (loginUid != null) {
      uid = loginUid;
      return uid;
    }
    return "";
  }

  Future apiCartView() async {
    final response = await http.post(APIUrls.cartViewOrder, body: {
      "user_id": getUid(),
    });
    return jsonDecode(response.body);
  }

  removeCartItem(String cartId) async {
    final response = await http.post(APIUrls.cartRemoveProduct, body: {
      "cart_id": cartId,
    });

    final data = jsonDecode(response.body);
    int flag2 = data['flag'];
    String message2 = data['message'];
    if (flag2 == 1) {
      print(message2);
      apiCartView();
      registerToast(message2);
    } else {
      print(message2);
      registerToast(message2);
    }
  }

  updateCartItem(String productId, String productPrice, String unitPrice,
      String productQty) async {
    final response = await http.post(APIUrls.cartUpdate, body: {
      "user_id": uid,
      "product_id": productId,
      "product_price": productPrice,
      "product_unit_price": unitPrice,
      "product_qty": productQty,
    });

    final data = jsonDecode(response.body);
    int flag3 = data['flag'];
    String message3 = data['message'];
    if (flag3 == 1) {
      print(message3);
      apiCartView();
      registerToast(message3);
    } else {
      print(message3);
      registerToast(message3);
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

  @override
  void initState() {
    getUserValuesSP();
    getUid();
    getCartProducts = apiCartView();
    // TODO: implement initState
    this.count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBB2C0D),
        title: Text("Cart"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: cartList.length != 0 ? bottomCheckout() : Container(),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: cartProductList(),
      ),
    );
  }

  Widget cartProductList() {
    return FutureBuilder(
        future: getCartProducts,
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            cartApiResponseModel = CartApiResponseModel.fromJson(snapShot.data);
            totalPrice = cartApiResponseModel.grandTotal;
            if (cartApiResponseModel.flag == 1) {
              cartList = cartApiResponseModel.cartList;
              if (cartList != null &&
                  cartList.length > 0 &&
                  cartApiResponseModel.message != "No Record Found") {
                return ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                        cartList[index].productImage),
                                  ),
                                ),
                                Flexible(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: Text(
                                                cartList[index].productName,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                cartList[index].productDetails,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "₹ " +
                                                      cartList[index]
                                                          .productPrice,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xffBB2C0D),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          // count = int.parse(cartList[index].productQty);
                                                          // if(count > 0){
                                                          //   count--;
                                                          // } else
                                                          // count = 0;
                                                          // updateCartItem(
                                                          //     cartList[index].productId,
                                                          //     cartList[index].productPrice,
                                                          //     cartList[index].productUnitPrice,
                                                          //     count.toString()
                                                          // );
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        color:
                                                            Color(0xffBB2C0D),
                                                      ),
                                                    ),
                                                    Text(
                                                      cartList[index]
                                                          .productQty,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.grey[800],
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          // count = int.parse(cartList[index].productQty);
                                                          // count++;
                                                          // updateCartItem(
                                                          //     cartList[index].productId,
                                                          //     cartList[index].productPrice,
                                                          //     cartList[index].productUnitPrice,
                                                          //     count.toString()
                                                          // );
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        color:
                                                            Color(0xffBB2C0D),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              removeCartItem(
                                                  cartList[index].cartId);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.clear,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    });
              } else
                return Center(
                    child: Text(
                  cartApiResponseModel.message,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ));
            } else
              return Center(
                child: Text(
                  cartApiResponseModel.message,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              );
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Text(
              'No Response Found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        });
  }

  Widget bottomCheckout() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 0, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Amount",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "₹ " + totalPrice.toString(),
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffBB2C0D),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Checkout()));
            },
            color: Color(0xffBB2C0D),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "CHECKOUT",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
