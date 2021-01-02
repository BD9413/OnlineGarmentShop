// To parse this JSON data, do
//
//     final addToCartResponseModel = addToCartResponseModelFromJson(jsonString);

import 'dart:convert';

AddToCartResponseModel addToCartResponseModelFromJson(String str) => AddToCartResponseModel.fromJson(json.decode(str));

String addToCartResponseModelToJson(AddToCartResponseModel data) => json.encode(data.toJson());

class AddToCartResponseModel {
  AddToCartResponseModel({
    this.flag,
    this.cartId,
    this.message,
  });

  int flag;
  int cartId;
  String message;

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) => AddToCartResponseModel(
    flag: json["flag"],
    cartId: json["cart_id"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
    "cart_id": cartId,
    "message": message,
  };
}
