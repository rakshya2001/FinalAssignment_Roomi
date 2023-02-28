// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int? ?? 0,
      productId: json['_id'] as String?,
      room_price: json['room_price'] as String?,
      room_location: json['room_location'] as String?,
      room_description: json['room_description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      '_id': instance.productId,
      'room_price': instance.room_price,
      'room_location': instance.room_location,
      'room_description': instance.room_description,
      'image': instance.image,
    };
