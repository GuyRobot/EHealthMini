import 'package:chat/api/ChatsApi.dart';
import 'package:chat/api/ChatsApiClient.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:chat/models/ChatbotRequest.dart';
import 'package:chat/models/ChatbotResponse.dart';
import 'package:chat/models/ConversationInfo.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatefulWidget {
  final List<ChatMessage> messages = [];
  final ConversationInfo conversationInfo;

  Body({Key? key, required this.conversationInfo}) : super(key: key) {
    this.messages.addAll(conversationInfo.getMessages());
  }

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ChatsApiClient chatsApiClient;

  @override
  void initState() {
    super.initState();
    final dio = ChatsApi.buildDio();
    chatsApiClient = ChatsApiClient(dio, baseUrl: ChatsApi.BASE_URL);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: widget.messages.length,
              itemBuilder: (context, index) =>
                  Message(message: widget.messages[index]),
            ),
          ),
        ),
        ChatInputField(
          onSubmitted: (value) async {
            setState(() {
              widget.messages.add(ChatMessage(
                  messageType: ChatMessageType.text,
                  messageStatus: MessageStatus.viewed,
                  isSender: true,
                  text: value));
            });
            List<ChatbotResponse>? replies = await chatsApiClient.chat(ChatbotRequest(
                sender: widget.conversationInfo.senderId, message: value));
            setState(() {
              widget.messages.add(ChatMessage(
                  messageType: ChatMessageType.text,
                  messageStatus: MessageStatus.viewed,
                  isSender: false,
                  text: replies?[0].text ?? ""));
            });
          },
        ),
      ],
    );
  }
}
