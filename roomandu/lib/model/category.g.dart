// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      categoryId: json['_id'] as String?,
      category_name: json['category_name'] as String?,
      cId: json['cId'] as int? ?? 0,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'cId': instance.cId,
      '_id': instance.categoryId,
      'category_name': instance.category_name,
    };
