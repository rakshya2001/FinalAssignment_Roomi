
import 'package:roomandu/data_source/local_data_source/user_data_source.dart';
import 'package:roomandu/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:roomandu/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUser();
  Future<int> addUser(User user);
  Future<bool> login(String username, String password);


}

class UserRepositoryImp extends UserRepository {
  @override
  Future<int> addUser(User user) {
    return UserRemoteDataSource().registerUser(user);
  }

  @override
  Future<List<User>> getAllUser() {
    return UserDataSource().getUser();
  }
  
  @override
  Future<bool> login(String username, String password) async{
    return UserRemoteDataSource().loginUser(username, password);
  }

}
