import 'dart:convert';

ApiResponseModel apiResponseModelFromJson(String str) => ApiResponseModel.fromJson(json.decode(str));

String apiResponseModelToJson(ApiResponseModel data) => json.encode(data.toJson());

class ApiResponseModel {
  ApiResponseModel({
    this.category,
    this.flag,
    this.message,
  });

  List<Category> category;
  int flag;
  String message;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    flag: json["flag"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "flag": flag,
    "message": message,
  };
}

class Category {
  Category({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });

  String categoryId;
  String categoryName;
  String categoryImage;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
