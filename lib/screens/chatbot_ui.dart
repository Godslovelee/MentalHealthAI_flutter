import 'package:flutter/material.dart';
import 'package:openai_chat_gpt_flutter/models/models_provider.dart';
import 'package:openai_chat_gpt_flutter/repository/api_repo.dart';
import 'package:openai_chat_gpt_flutter/widgets/chat_widget.dart';
import 'package:provider/provider.dart';

import '../models/chat_model.dart';

class ChatBotWidget extends StatefulWidget {
  @override
  _ChatBotWidgetState createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
 
  late TextEditingController textEditingController;
  final List<String> _messages = [];

  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  List<ChatModel> chatList = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
    });
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (BuildContext context, index) {
                return ChatWidget(
                    msg: chatList[index].msg,
                    chatIndex: (chatList[index].chatIndex));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      await sendMessageFCT(modelsProvider: modelProvider);
                    },
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: () async {
                    await sendMessageFCT(modelsProvider: modelProvider);
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendMessageFCT({required ModelsProvider modelsProvider}) async {
    try {
      print("Sending chat data");
      chatList = await APIservice.sendChatData(
          message: textEditingController.text,
          modelId: modelsProvider.getCurrentModel);


    } catch (e) {
      print("error $e");
    }

    final message = textEditingController.text.trim();
    if (message.isNotEmpty) {
      _sendMessage(message);
      print("message sending");
    }
  }
}
