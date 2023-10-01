// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatbotRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatbotRequest _$ChatbotRequestFromJson(Map<String, dynamic> json) =>
    ChatbotRequest(
      sender: json['sender'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ChatbotRequestToJson(ChatbotRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sender': instance.sender,
    };
