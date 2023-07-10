class ChatResponse {
  final String? message;
  final String? role;
  final String? context;
  final String? promptToken;
  final List<String>? choices;
  final String? answer;

  ChatResponse.elements(
      this.message, this.role, this.context, this.promptToken, this.choices, this.answer);

  factory ChatResponse.fromJsonResponse(Map<String, dynamic> json) {
    return ChatResponse.elements(
      json['message'],
      json['role'],
      json['context'],
      json['promptToken'],
      json['choices'] != null ? List<String>.from(json['choices']) : null,
      json['answer']
    );
  }
}

//For testing purpose
void main() {
  Map<String, dynamic> jsonResponse = {
    "message": "This is a response message.",
    "context": "Additional context information.",
    "choices": ["Option 1", "Option 2", "Option 3"],
    "promptToken": "abc123",
    "role": "assistant"
  };

  ChatResponse response = ChatResponse.fromJsonResponse(jsonResponse);
  print(response.message);
  print(response.context);
  print(response.choices);
  print(response.promptToken);
  print(response.role);
}
