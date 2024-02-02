import 'dart:convert';

import 'package:chatgpt_clone/constants/api_constant.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  static Future <void> getModels() async {
    try {
      var response =await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization':'Bearer $API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);
      print("jsonResponse $jsonResponse");
    } catch (error) {
      print("error $error");
    }
  }
}