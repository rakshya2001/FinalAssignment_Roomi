

import 'package:roomandu/helper/objectbox.dart';
import 'package:roomandu/model/user.dart';
import 'package:roomandu/state/objectbox_state.dart';

class UserDataSource{
  // ObjectBoxInstance get ObjectBoxInstance => ObjectBoxState.objectBoxInstance!;
  ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;

  Future<int> addUser(User user) async{
    try{
      return objectBoxInstance2.addUser(user);
    } catch(e){
      return Future.value(0);
    }
  }

  Future<List<User>> getUser() async{
    try{
      return objectBoxInstance2.getAllUser();
    } catch(e){
      throw Exception('Error in getting all user');
    }
  }
}