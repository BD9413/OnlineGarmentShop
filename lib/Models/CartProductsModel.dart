// To parse this JSON data, do
//
//     final cartApiResponseModel = cartApiResponseModelFromJson(jsonString);

import 'dart:convert';

CartApiResponseModel cartApiResponseModelFromJson(String str) => CartApiResponseModel.fromJson(json.decode(str));

String cartApiResponseModelToJson(CartApiResponseModel data) => json.encode(data.toJson());

class CartApiResponseModel {
  CartApiResponseModel({
    this.cartList,
    this.grandTotal,
    this.totalQty,
    this.flag,
    this.message,
  });

  List<CartList> cartList;
  int grandTotal;
  int totalQty;
  int flag;
  String message;

  factory CartApiResponseModel.fromJson(Map<String, dynamic> json) => CartApiResponseModel(
    cartList: List<CartList>.from(json["cart"].map((x) => CartList.fromJson(x))),
    grandTotal: json["grand_total"],
    totalQty: json["total_qty"],
    flag: json["flag"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "cart": List<dynamic>.from(cartList.map((x) => x.toJson())),
    "grand_total": grandTotal,
    "total_qty": totalQty,
    "flag": flag,
    "message": message,
  };
}

class CartList {
  CartList({
    this.cartId,
    this.productId,
    this.productName,
    this.productDetails,
    this.productImage,
    this.productPrice,
    this.productUnitPrice,
    this.productQty,
  });

  String cartId;
  String productId;
  String productName;
  String productDetails;
  String productImage;
  String productPrice;
  String productUnitPrice;
  String productQty;

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
    cartId: json["cart_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productDetails: json["product_details"],
    productImage: json["product_image"],
    productPrice: json["product_price"],
    productUnitPrice: json["product_unit_price"],
    productQty: json["product_qty"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "product_id": productId,
    "product_name": productName,
    "product_details": productDetails,
    "product_image": productImage,
    "product_price": productPrice,
    "product_unit_price": productUnitPrice,
    "product_qty": productQty,
  };
}
