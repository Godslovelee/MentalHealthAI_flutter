import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:openai_chat_gpt_flutter/repository/chat_request.dart';
import 'package:openai_chat_gpt_flutter/repository/chat_response.dart';
import 'chat_request_headers.dart';
import 'package:http/http.dart' as http;



class ChatService {
  Future<ChatResponse?> getChatData(String message) async {
    debugPrint("Getting Chat Data");

    ChatRequest request = ChatRequest(
      message: message,
      temperature: 0.5,
      maxTokens: 50,
      timestamp: DateTime.now(),
      prompt:
          "Hi Welcome to the mental health support app, How may i be of assitance",
    );

    Map<String, dynamic> requestBody = jsonDecode(request.toJson());
    print(requestBody);

    String apiUrl =
        'https://api.openai.com/v1/chat/completions'; // Replace with the actual API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return ChatResponse.fromJsonResponse(jsonResponse);
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      // Handle network or other error
      print('Error: $error');
      return null;
    }
  }
}
