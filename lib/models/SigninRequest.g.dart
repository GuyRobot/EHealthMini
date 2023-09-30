// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SigninRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninRequest _$SigninRequestFromJson(Map<String, dynamic> json) =>
    SigninRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SigninRequestToJson(SigninRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
