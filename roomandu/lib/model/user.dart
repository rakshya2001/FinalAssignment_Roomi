
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
// import 'package:roomandu/model/role.dart';

part "user.g.dart";
@Entity()
@JsonSerializable()
class User {
  @Id(assignable: true)
  int uId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? userId;

  String? firstName;
  String? lastName;
  String? username;
  String? phoneNumber;
  String? password;


  // final role= ToOne<Role>();
  User({this.firstName, this.lastName, this.username, this.password, this.phoneNumber,this.userId,
      this.uId = 0});

  factory User.fromJson(Map<String, dynamic> json)=>
  _$UserFromJson(json);

  Map<String, dynamic > tojson()=> _$UserToJson(this);
}
