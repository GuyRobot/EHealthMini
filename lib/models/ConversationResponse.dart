import 'package:json_annotation/json_annotation.dart';

part 'ConversationResponse.g.dart';

@JsonSerializable()
class ConversationResponse {
  String conversationId;

  ConversationResponse(
      {required this.conversationId});

  factory ConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationResponseToJson(this);
}
