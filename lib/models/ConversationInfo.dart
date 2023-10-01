import 'package:chat/models/ChatMessage.dart';
import 'package:chat/models/ConversationMessage.dart';

class ConversationInfo {
  final String senderId;
  final List<dynamic> events;

  ConversationInfo(this.senderId, {required this.events});

  ConversationMessage lastMessage() {
    for (var index = events.length - 1; index >= 0; index--) {
      final message = events[index];
      if (message['event'] == 'user' || message['event'] == 'bot') {
        return ConversationMessage(
            message['text'], message['timestamp'].toString());
      }
    }

    return ConversationMessage("message", "0");
  }

  List<ChatMessage> getMessages() {
    List<ChatMessage> messages = [];
    for (var index = 0; index < events.length; index++) {
      final message = events[index];
      if (message['event'] == 'user' || message['event'] == 'bot') {
        messages.add(
          ChatMessage(
            messageType: ChatMessageType.text,
            messageStatus: MessageStatus.viewed,
            isSender: message['event'] == 'user',
            text: message['text'],
          ),
        );
      }
    }

    return messages;
  }
}
