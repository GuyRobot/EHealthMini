import 'package:chat/models/ChatRequestMessage.dart';
import 'package:chat/models/ChatRequestSender.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChatRequestMessaging.g.dart';

@JsonSerializable()
class ChatRequestMessaging {
  ChatRequestMessage requestMessage;
  ChatRequestSender sender;

  ChatRequestMessaging({
    required this.requestMessage,
    required this.sender,
  });

  factory ChatRequestMessaging.fromJson(Map<String, dynamic> json) => _$ChatRequestMessagingFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRequestMessagingToJson(this);
}