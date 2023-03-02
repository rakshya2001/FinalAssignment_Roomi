 import 'package:json_annotation/json_annotation.dart';
import 'package:roomandu/model/user.dart';

part 'user_reponse.g.dart';

@JsonSerializable()
 class UserResponse {
   bool? success;
    String? message;
    List<User>? data;
 
   UserResponse({this.success, this.message, this.data});
 
   factory UserResponse.fromJson(Map<String, dynamic> json) =>
       _$UserResponseFromJson(json);
 
   Map<String, dynamic> toJson() => _$UserResponseToJson(this);
 }