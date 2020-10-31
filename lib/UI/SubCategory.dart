import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
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
        title: Text("Sub Category"),
      ),
      body: gridView,
    );
  }

  var gridView = new GridView.builder(
      itemCount: 20,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            margin: EdgeInsets.all(10),
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              child: new Text('Item $index'),
            ),
          ),
          onTap: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              child: new CupertinoAlertDialog(
                title: new Column(
                  children: <Widget>[
                    new Text("GridView"),
                    new Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                  ],
                ),
                content: new Text("Selected Item $index"),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text("OK"))
                ],
              ),
            );
          },
        );
      });
}
