
import 'package:roomandu/data_source/local_data_source/user_data_source.dart';
import 'package:roomandu/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUser();
  Future<int> addUser(User user);
  Future<User> signUp(String username, String password);


}

class UserRepositoryImp extends UserRepository {
  @override
  Future<int> addUser(User user) {
    return UserDataSource().addUser(user);
  }

  @override
  Future<List<User>> getAllUser() {
    return UserDataSource().getUser();
  }
  
  @override
  Future<User> signUp(String username, String password) {
    return UserDataSource().signUp(username, password);
  }

}
