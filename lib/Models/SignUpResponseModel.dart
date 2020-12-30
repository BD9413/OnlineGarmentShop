// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class RegisterModel {
  RegisterModel({
    this.flag,
    this.uid,
    this.uname,
    this.message,
  });

  int flag;
  int uid;
  String uname;
  String message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
