import 'package:posts/geo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
