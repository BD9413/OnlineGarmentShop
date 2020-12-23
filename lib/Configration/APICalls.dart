
import 'dart:convert';

import 'package:online_garment_shop/Configration/APIUrls.dart';
import 'package:online_garment_shop/Models/SignUpResponseModel.dart';
import 'package:http/http.dart' as http;

class APICalls{

  static Future<RegisterModel> registerAPICall(var apiRequestBody) async{
    final response = await http.post(
      APIUrls.signUp,
      body: apiRequestBody
    );
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Register');
    }
  }
}