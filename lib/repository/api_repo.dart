import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:openai_chat_gpt_flutter/models/chat_model.dart';
import 'package:openai_chat_gpt_flutter/models/models_model.dart';

import '../openai/api_key.dart';
import '../openai/base_url.dart';

class APIservice {
  static Future<List<ModelModels>> getNodelData() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $openAiApiKey'},
      );
      Map jsonResponse = jsonDecode(response.body);
      print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        print("temp ${value["id"]}");
      }
      return ModelModels.modelsFromSnap(temp);
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }

  //Sending chat

  static Future<List<ChatModel>> sendChatData(
      {required String message, required String modelId}) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL/completions"),
        headers: {
          'Authorization': 'Bearer $openAiApiKey',
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "model": modelId,
          "prompt": message,
          "max_tokens": 1000,
          "temperature": 0
        }),
      );
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }
      List<ChatModel> chatList = [];

      if (jsonResponse["choices"].length > 0) {
        //print("jsonChatResponse[choices]text ${jsonResponse["choices"][0]["text"]}");
        chatList = List.generate(
            jsonResponse["choices"].length,
            (index) => ChatModel(
                msg: jsonResponse["choices"][index]["text"], chatIndex: 1));
      }
      return chatList;
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }
}
