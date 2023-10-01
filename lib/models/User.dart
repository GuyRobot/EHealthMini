import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? email;
  String? role;
  @JsonKey(name: "_id")
  String id;

  User({required this.id, this.name, this.email, this.role});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
