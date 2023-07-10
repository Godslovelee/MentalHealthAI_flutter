class ChatModel{
  final String msg;
  final int chatIndex;

  ChatModel({required this.msg, required this.chatIndex});

  factory ChatModel.fromJson(Map<String, dynamic> jsonmodel) => ChatModel(
      msg: jsonmodel["msg"],
      chatIndex: jsonmodel["chatIndex"],);

}