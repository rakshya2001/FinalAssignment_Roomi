import 'package:objectbox/objectbox.dart';

@Entity()
class Role{
  @Id(assignable: true)
  int roleId;
  String type;

  Role(this.type,{this.roleId=0});
}