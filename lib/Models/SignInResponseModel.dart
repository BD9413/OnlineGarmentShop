// To parse this JSON data, do
//
//     final sIgnInResponseModel = sIgnInResponseModelFromJson(jsonString);

import 'dart:convert';

SIgnInResponseModel sIgnInResponseModelFromJson(String str) => SIgnInResponseModel.fromJson(json.decode(str));

String sIgnInResponseModelToJson(SIgnInResponseModel data) => json.encode(data.toJson());

class SIgnInResponseModel {
  SIgnInResponseModel({
    this.userdata,
    this.flag,
    this.message,
  });

  Userdata userdata;
  int flag;
  String message;

  factory SIgnInResponseModel.fromJson(Map<String, dynamic> json) => SIgnInResponseModel(
    userdata: Userdata.fromJson(json["userdata"]),
    flag: json["flag"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "userdata": userdata.toJson(),
    "flag": flag,
    "message": message,
  };
}

class Userdata {
  Userdata({
    this.userId,
    this.userName,
    this.userGender,
    this.userEmail,
    this.userMobile,
    this.userPassword,
    this.userAddress,
    this.userPhoto,
  });

  String userId;
  String userName;
  String userGender;
  String userEmail;
  String userMobile;
  String userPassword;
  String userAddress;
  String userPhoto;

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
    userId: json["user_id"],
    userName: json["user_name"],
    userGender: json["user_gender"],
    userEmail: json["user_email"],
    userMobile: json["user_mobile"],
    userPassword: json["user_password"],
    userAddress: json["user_address"],
    userPhoto: json["user_photo"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "user_gender": userGender,
    "user_email": userEmail,
    "user_mobile": userMobile,
    "user_password": userPassword,
    "user_address": userAddress,
    "user_photo": userPhoto,
  };
}
