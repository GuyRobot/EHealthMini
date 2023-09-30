import 'package:json_annotation/json_annotation.dart';

part 'SignupRequest.g.dart';

@JsonSerializable()
class SignupRequest {
  String username;
  String email;
  String password;

  SignupRequest(
      {required this.username, required this.email, required this.password});

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
