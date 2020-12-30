// To parse this JSON data, do
//
//     final subCategoriesResponseModel = subCategoriesResponseModelFromJson(jsonString);

import 'dart:convert';

SubCategoriesResponseModel subCategoriesResponseModelFromJson(String str) => SubCategoriesResponseModel.fromJson(json.decode(str));

String subCategoriesResponseModelToJson(SubCategoriesResponseModel data) => json.encode(data.toJson());

class SubCategoriesResponseModel {
  SubCategoriesResponseModel({
    this.subCategoryModel,
    this.flag,
    this.message,
  });

  List<SubCategoryModel> subCategoryModel;
  int flag;
  String message;

  factory SubCategoriesResponseModel.fromJson(Map<String, dynamic> json) => SubCategoriesResponseModel(
    subCategoryModel: List<SubCategoryModel>.from(json["sub_category"].map((x) => SubCategoryModel.fromJson(x))),
    flag: json["flag"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "sub_category": List<dynamic>.from(subCategoryModel.map((x) => x.toJson())),
    "flag": flag,
    "message": message,
  };
}

class SubCategoryModel {
  SubCategoryModel({
    this.subCategoryId,
    this.subCategoryName,
    this.categoryId,
    this.subCategoryImage,
  });

  String subCategoryId;
  String subCategoryName;
  String categoryId;
  String subCategoryImage;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    subCategoryId: json["sub_category_id"],
    subCategoryName: json["sub_category_name"],
    categoryId: json["category_id"],
    subCategoryImage: json["sub_category_image"],
  );

  Map<String, dynamic> toJson() => {
    "sub_category_id": subCategoryId,
    "sub_category_name": subCategoryName,
    "category_id": categoryId,
    "sub_category_image": subCategoryImage,
  };
}
