import 'package:chat/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SigninResponse.g.dart';

@JsonSerializable()
class SigninResponse {
  bool success;
  String message;
  String? token;
  User? user;

  SigninResponse(
      {required this.success, required this.message, this.token, this.user});

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}
