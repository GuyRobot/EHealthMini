import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:chat/models/ConversationInfo.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  final List<ChatMessage> messages = [];
  final ConversationInfo conversationInfo;

  MessagesScreen({Key? key, required this.conversationInfo}) : super(key: key) {
    this.messages.addAll(conversationInfo.getMessages());
  }

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        conversationInfo: widget.conversationInfo,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/bot.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Medical Bot",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Available",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
