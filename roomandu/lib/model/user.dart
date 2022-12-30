
import 'package:objectbox/objectbox.dart';
// import 'package:roomandu/model/role.dart';

@Entity()
class User {
  @Id(assignable: true)
  int userId;
  String fname;
  String lname;
  String username;
  String number;
  String password;

  // final role= ToOne<Role>();
  User(this.fname, this.lname, this.username, this.password, this.number,
      {this.userId = 0});
}
