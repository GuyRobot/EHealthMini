import 'package:json_annotation/json_annotation.dart';

part 'ChatbotResponse.g.dart';

@JsonSerializable()
class ChatbotResponse {
  String text;
  @JsonKey(name: "recipient_id")
  String recipientId;

  ChatbotResponse({required this.text, required this.recipientId});

  factory ChatbotResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatbotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotResponseToJson(this);
}
