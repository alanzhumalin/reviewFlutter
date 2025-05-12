import 'package:posts/address.dart';
import 'package:posts/company.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(
      {required this.address,
      required this.company,
      required this.email,
      required this.id,
      required this.name,
      required this.phone,
      required this.username,
      required this.website});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
