import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'product.g.dart';

@Entity()
@JsonSerializable()
class Product {
  int id;
  @Unique()
  @JsonKey(name: '_id')
  String? productId;
  String? room_price;
  String? room_location;
  String? room_description;
  String? image;



  Product(
      {this.id = 0,
      this.productId,
      this.room_price,
      this.room_location,
      this.room_description,
      
      this.image});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
