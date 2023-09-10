// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatRequestMessaging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRequestMessaging _$ChatRequestMessagingFromJson(
        Map<String, dynamic> json) =>
    ChatRequestMessaging(
      requestMessage: ChatRequestMessage.fromJson(
          json['requestMessage'] as Map<String, dynamic>),
      sender:
          ChatRequestSender.fromJson(json['sender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatRequestMessagingToJson(
        ChatRequestMessaging instance) =>
    <String, dynamic>{
      'requestMessage': instance.requestMessage,
      'sender': instance.sender,
    };
