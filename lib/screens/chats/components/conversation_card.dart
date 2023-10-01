import 'package:chat/models/ConversationInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../constants.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final ConversationInfo chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final lastMessage = chat.lastMessage();
    final dt = DateTime.fromMicrosecondsSinceEpoch((double.parse(lastMessage.timestamp) * 1000000).ceil());
    final timestamp = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage("assets/images/bot.png"),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      timestamp,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        lastMessage.message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(timeago.format(dt)),
            ),
          ],
        ),
      ),
    );
  }
}
