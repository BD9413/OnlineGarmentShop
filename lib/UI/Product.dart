import 'dart:ui';

import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffBB2C0D),
        title: Text("Product"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStJfeEdmKbCRwoLAoGaH7-2Y3L38fhYnpuF-EqcCIGL6G3Eav_5wm2QOOBxkU8RqCayNKx9L9l&usqp=CAc"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HRX by Hrithik Roshan",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Men Yellow Printed Round Neck T-Shirt",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "₹ 3200",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
