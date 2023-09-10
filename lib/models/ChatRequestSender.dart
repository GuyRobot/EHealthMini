import 'package:json_annotation/json_annotation.dart';
part 'ChatRequestSender.g.dart';

@JsonSerializable()
class ChatRequestSender {
  String id;

  ChatRequestSender({required this.id});

  factory ChatRequestSender.fromJson(Map<String, dynamic> json) => _$ChatRequestSenderFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRequestSenderToJson(this);
}