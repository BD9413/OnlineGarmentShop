// To parse this JSON data, do
//
//     final subCategoriesResponseModel = subCategoriesResponseModelFromJson(jsonString);

import 'dart:convert';

ProductResponseModel productResponseModel(String str) => ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) => json.encode(data.toJson());

class ProductResponseModel {
  ProductResponseModel({
    this.product,
    this.flag,
    this.message,
  });

  List<Products> product;
  int flag;
  String message;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => ProductResponseModel(
    product: List<Products>.from(json["product"].map((x) => Products.fromJson(x))),
    flag: json["flag"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "product": List<dynamic>.from(product.map((x) => x.toJson())),
    "flag": flag,
    "message": message,
  };
}

class Products {
  Products({
    this.productId,
    this.productName,
    this.productDetails,
    this.productPrice,
    this.productImage,
    this.productQuantity,
    this.subCategoryName,
    this.subCategoryId,
  });

  String productId;
  String productName;
  String productDetails;
  String productPrice;
  String productImage;
  String productQuantity;
  String subCategoryName;
  String subCategoryId;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    productId: json["product_id"],
    productName: json["product_name"],
    productDetails: json["product_details"],
    productPrice: json["product_price"],
    productImage: json["product_image"],
    productQuantity: json["product_quantity"],
    subCategoryName: json["sub_category_name"],
    subCategoryId: json["sub_category_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_details": productDetails,
    "product_price": productPrice,
    "product_image": productImage,
    "product_quantity": productQuantity,
    "sub_category_name": subCategoryName,
    "sub_category_id": subCategoryId,
  };
}
