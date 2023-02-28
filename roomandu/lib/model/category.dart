import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:roomandu/model/product.dart';

part 'category.g.dart';

@Entity()
@JsonSerializable()
class Category {
  @Id(assignable: true)
  int cId;
  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? categoryId;
  String? category_name;


  Category({this.categoryId, this.category_name, this.cId = 0});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
