
import 'package:roomandu/helper/objectbox.dart';
import 'package:roomandu/model/user.dart';
import 'package:roomandu/state/objectbox_state.dart';

class UserDataSource {
  ObjectBoxInstance get _objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addUser(User user) async {
    try {
      return _objectBoxInstance.addUser(user);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<User>> getUser() async {
    try {
      return _objectBoxInstance.getAllUser();
    } catch (e) {
      throw Exception("Error in getting all user");
    }
  }
  Future<User> signUp(String username, String password) async {

    try {

      return _objectBoxInstance.loginUser(username, password)!;

    } catch (e) {

      throw Exception("Login Unsuccessful");

    }

  }
}
