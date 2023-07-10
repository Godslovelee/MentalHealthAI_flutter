import 'dart:convert';

class ChatRequest {
  final String? message;
  final String? context;
  final double? temperature;
  final String? sender;
  final int? maxTokens;
  final DateTime timestamp;
  final String? prompt;

  ChatRequest({
    required this.message,
    required this.temperature,
    required this.maxTokens,
    required this.timestamp,
    this.context,
    this.sender,
    this.prompt,
  });

  Map<String, dynamic> jsonBody() {
    return {
      'message': message,
      'context': context,
      'temperature': temperature,
      'sender': sender,
      'maxTokens': maxTokens,
      'timestamp': timestamp.toIso8601String(),
      'prompt': prompt,
    };
  }

  String toJson() {
    return jsonEncode(jsonBody());
  }
}
