// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRequest _$ChatRequestFromJson(Map<String, dynamic> json) => ChatRequest(
      entry:
          ChatRequestMessaging.fromJson(json['entry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatRequestToJson(ChatRequest instance) =>
    <String, dynamic>{
      'entry': instance.entry,
    };
