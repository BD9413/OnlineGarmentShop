import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:online_garment_shop/Configration/APIUrls.dart';
import 'package:online_garment_shop/Models/ProductModel.dart';
import 'package:online_garment_shop/UI/ProductDetail.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int flag = 0;
  String message = '';
  List<Products> products = [];

  getProduct() async {
    final response = await http.get(APIUrls.viewProduct);
    final data = jsonDecode(response.body);
    ProductResponseModel productResponseModel = ProductResponseModel.fromJson(data);
    flag = productResponseModel.flag;
    message = productResponseModel.message;
    products = productResponseModel.product;
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getProduct();
    });
    super.initState();
    //getProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBB2C0D),
        title: Text("Product"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(products: products[index],)));
                },
                child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            child: Image.network(
                                products[index].productImage),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].productName,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  products[index].productDetails,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    products[index].productPrice,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
