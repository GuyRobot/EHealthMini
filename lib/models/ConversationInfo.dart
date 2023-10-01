import 'package:chat/models/ConversationMessage.dart';

class ConversationInfo {
  final String id;
  final List<dynamic> events;

  ConversationInfo(this.id, {required this.events});

  ConversationMessage lastMessage() {
    for (var index = events.length - 1; index >= 0; index--) {
      final message = events[index];
      if (message['event'] == 'user' || message['event'] == 'bot') {
        return ConversationMessage(message['text'], message['timestamp'].toString());
      }
    }

    return ConversationMessage("message", "0");
  }
}
