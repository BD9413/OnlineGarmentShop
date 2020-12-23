// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.flag,
    this.uid,
    this.uname,
    this.message,
  });

  int flag;
  int uid;
  String uname;
  String message;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    flag: json["flag"],
    uid: json["uid"],
    uname: json["uname"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
    "uid": uid,
    "uname": uname,
    "message": message,
  };
}
