import 'package:json_annotation/json_annotation.dart';

part 'ChatbotRequest.g.dart';

@JsonSerializable()
class ChatbotRequest {
  String message;
  String sender;

  ChatbotRequest({required this.sender, required this.message});

  factory ChatbotRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatbotRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotRequestToJson(this);
}
