import 'package:chat/api/ChatsApi.dart';
import 'package:chat/api/ChatsApiClient.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:chat/models/ChatResponse.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<ChatMessage> messages = [];
  late ChatsApiClient chatsApiClient;

  @override
  void initState() {
    super.initState();
    final dio = ChatsApi.buildDio();
    chatsApiClient = ChatsApiClient(dio);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) =>
                  Message(message: messages[index]),
            ),
          ),
        ),
        ChatInputField(
          onSubmitted: (value) async {
            setState(() {
              messages.add(ChatMessage(
                  messageType: ChatMessageType.text,
                  messageStatus: MessageStatus.viewed,
                  isSender: true,
                  text: value));
            });
            ChatResponse? response =
                await chatsApiClient.chat(ChatResponse(message: value));
            setState(() {
              messages.add(ChatMessage(
                  messageType: ChatMessageType.text,
                  messageStatus: MessageStatus.viewed,
                  isSender: false,
                  text: response?.message ?? ""));
            });
          },
        ),
      ],
    );
  }
}
