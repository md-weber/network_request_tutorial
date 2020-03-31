import 'package:json_annotation/json_annotation.dart';
import 'package:network_request/model/name_model.dart';
import 'package:network_request/model/picture_model.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  NameModel name;
  String phone;
  String email;
  PictureModel picture;

  PersonModel({this.name, this.phone, this.email, this.picture});

  factory PersonModel.fromJson(Map<String, dynamic> json) => _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}
