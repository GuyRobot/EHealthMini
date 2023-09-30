import 'package:json_annotation/json_annotation.dart';

part 'SigninRequest.g.dart';

@JsonSerializable()
class SigninRequest {
  String email;
  String password;

  SigninRequest(
      {required this.email, required this.password});

  factory SigninRequest.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);
}
