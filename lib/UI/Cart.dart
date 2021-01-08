import 'package:flutter/material.dart';
import 'package:online_garment_shop/UI/Checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  int count = 0;
  String loginUid = "";
  String registerUid = "";

  getUserValuesSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginUid = prefs.getString('registerFlag');
    registerUid = prefs.getString('registerUid');
  }

  @override
  void initState() {
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
        child: bottomCheckout(),
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
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStJfeEdmKbCRwoLAoGaH7-2Y3L38fhYnpuF-EqcCIGL6G3Eav_5wm2QOOBxkU8RqCayNKx9L9l&usqp=CAc"),
                        ),
                      ),
                      Flexible(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:15.0),
                                    child: Text(
                                      "HRX by Hrithik Roshan",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Men Yellow Printed Round Neck T-Shirt",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹ 3200",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffBB2C0D),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                                if(count > 0){
                                                  count--;
                                                } else
                                                count = 0;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: Color(0xffBB2C0D),
                                            ),
                                          ),
                                          Text(
                                            count.toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.w300),
                                          ),
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                                count++;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Color(0xffBB2C0D),
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

                                },
                                icon: Icon(Icons.clear, color: Colors.grey[700],),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            }),
      ),
    );
  }
  Widget bottomCheckout() {
    return Padding(
      padding:
      const EdgeInsets.only(top: 5.0, bottom: 0, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(
              "Total Amount",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
              Text(
                "₹ 3200",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffBB2C0D),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout()));
            },
            color: Color(0xffBB2C0D),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "CHECKOUT",
              style: TextStyle(
                  fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
