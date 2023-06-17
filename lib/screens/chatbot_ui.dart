import 'package:flutter/material.dart';

class ChatBotWidget extends StatefulWidget {
  @override
  _ChatBotWidgetState createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
    });
    // Implement your chatbot logic here and generate a response
    String response = generateResponse(message);
    setState(() {
      _messages.add(response);
    });
    _controller.clear();
  }

  String generateResponse(String message) {
    // Replace this with your own logic to generate chatbot responses
    // You can use AI or predefined logic to generate responses
    return "You said: $message";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_messages[index]),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _sendMessage(_controller.text);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
