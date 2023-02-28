// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      userId: json['_id'] as String?,
      email: json['email'] as String?,
      uId: json['uId'] as int? ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uId': instance.uId,
      '_id': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'email': instance.email,
    };
