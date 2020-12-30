import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_garment_shop/Configration/APIUrls.dart';
import 'package:online_garment_shop/Models/SubCategoriesResponseModel.dart';

class SubCategory extends StatefulWidget {
  final categoryId;
  SubCategory(this.categoryId);
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {

  int flag = 0;
  String message = '';
  List<SubCategoryModel> subCategoryModel = [];

  getSubCategories() async {

    final response = await http.post(APIUrls.subCategories, body: {
      "category_id": widget.categoryId,
    });

    final data = jsonDecode(response.body);
    flag = data['flag'];
    message = data['message'];
    var subCatList = data['sub_category'] as List;
    subCategoryModel = subCatList.map((e) => SubCategoryModel.fromJson(e)).toList();

  }

  @override
  void initState() {
    getSubCategories();
    // TODO: implement initState
    super.initState();
  }

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
      body: subCategoryGridList(),
    );
  }

  Widget subCategoryGridList() {
    return new GridView.builder(
        itemCount: subCategoryModel.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  new Card(
                      margin: EdgeInsets.all(4),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Image.network(
                        subCategoryModel[index].subCategoryImage,
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      subCategoryModel[index].subCategoryName,
                    ),
                  )
                ],
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
                  content: new Text("Selected Item ${subCategoryModel[index].subCategoryId}"),
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
}
