import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/ConversationInfo.dart';
import 'package:chat/screens/chats/components/conversation_card.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<ConversationInfo> infos;
  Body({Key? key, required this.infos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              const SizedBox(width: kDefaultPadding),
              FillOutlineButton(
                press: () {},
                text: "Unread",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: infos.length,
            itemBuilder: (context, index) => ConversationCard(
              chat: infos[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
