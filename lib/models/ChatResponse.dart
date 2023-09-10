import 'package:json_annotation/json_annotation.dart';
part 'ChatResponse.g.dart';

@JsonSerializable()
class ChatResponse {
  String message;

  ChatResponse({required this.message});

  factory ChatResponse.fromJson(Map<String, dynamic> json) => _$ChatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}