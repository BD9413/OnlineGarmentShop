import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: bottomCheckout(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            margin: EdgeInsets.only(top:25,left: 25, right: 25),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.only(left:20, right: 20,),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: mobile,
                    decoration: InputDecoration(
                      labelText: "Mobile",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 5,
                    controller: address,
                    decoration: InputDecoration(
                        focusColor: Color(0xffBB2C0D),
                        labelText: "Address",
                        labelStyle: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(25),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        color: Colors.transparent,
                        height: 40,
                        width: 40,
                        child: Card(
                          child: Image.asset("Assets/ic_pay_method.png", fit: BoxFit.fill,),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How do you want to pay?",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xffBB2C0D),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Select Payment Method",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 15)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomCheckout() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, bottom: 10, left: 25, right: 25),
      child: RaisedButton(
        onPressed: () {},
        color: Color(0xffBB2C0D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          "Submit",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
