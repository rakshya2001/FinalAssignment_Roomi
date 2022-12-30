

import 'package:roomandu/data_source/local_data_source/user_data_source.dart';
import 'package:roomandu/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();
  Future<int> addUser(User user);
  // Future<Student?> loginStudent(String username, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addUser(User user) {
    return UserDataSource().addUser(user);
  }

  @override
  Future<List<User>> getUser() {
    return UserDataSource().getUser();
  }
}
