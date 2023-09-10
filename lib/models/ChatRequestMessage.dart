import 'package:json_annotation/json_annotation.dart';
part 'ChatRequestMessage.g.dart';

@JsonSerializable()
class ChatRequestMessage {
  String message;

  ChatRequestMessage({required this.message});

  factory ChatRequestMessage.fromJson(Map<String, dynamic> json) => _$ChatRequestMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRequestMessageToJson(this);
}