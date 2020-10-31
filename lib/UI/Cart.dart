import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
        title: Text("Cart"),
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
                    padding: EdgeInsets.all(8.0),
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "HRX by Hrithik Roshan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                IconButton(
                                  onPressed: () {

                                  },
                                  icon: Icon(Icons.clear),
                                )
                              ],
                            ),
                            Container(
                              child: Text(
                                "Men Yellow Printed Round Neck T-Shirt",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              "₹ 3200",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xffDD2C0D),
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
