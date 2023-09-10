import 'package:chat/models/ChatRequestMessaging.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChatRequest.g.dart';

@JsonSerializable()
class ChatRequest {
  ChatRequestMessaging entry;

  ChatRequest({required this.entry});

  factory ChatRequest.fromJson(Map<String, dynamic> json) => _$ChatRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRequestToJson(this);
}