import 'package:json_annotation/json_annotation.dart';

part 'user_login_response.g.dart';

@JsonSerializable()
class LoginResponse{
  String? status;
  String? token;
  String? userid;

  LoginResponse({this.status,this.token,this.userid});

  factory LoginResponse.fromJson(Map<String, dynamic> json)=>
  _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson()=> _$LoginResponseToJson(this);
}