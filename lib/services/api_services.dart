import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_clone/constants/api_constant.dart';
import 'package:chatgpt_clone/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      print("jsonResponse $jsonResponse");
     //empty list 
      List temp = [];
      for (var value in jsonResponse["data"]) {
        //append all the data item to the list below
        temp.add(value);
        //printing all the list by their id
        log("temp ${value["id"]}");
      }
      //list parsed to the snapshot function in the models_models.dart file. 
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }
}
