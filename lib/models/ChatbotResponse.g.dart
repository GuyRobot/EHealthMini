// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatbotResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatbotResponse _$ChatbotResponseFromJson(Map<String, dynamic> json) =>
    ChatbotResponse(
      text: json['text'] as String,
      recipientId: json['recipient_id'] as String,
    );

Map<String, dynamic> _$ChatbotResponseToJson(ChatbotResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'recipient_id': instance.recipientId,
    };
