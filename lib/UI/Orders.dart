import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
        title: Text("Orders"),
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
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ORDER ID",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "PAID VIA",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Text(
                                "Cash On Delivery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ORDER DATE",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        "2020-09-25",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "TOTAL AMOUNT",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        "₹ 2700",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Divider(
                        color: Color(0xffBB2C0D),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "CANCELLED",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        color: Color(0xffBB2C0D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
