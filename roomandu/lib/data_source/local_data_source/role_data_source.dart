import 'package:roomandu/helper/objectbox.dart';
import 'package:roomandu/model/role.dart';
import 'package:roomandu/state/objectbox_state.dart';

class RoleDataSource{
  ObjectBoxInstance get objectBoxInstance=> ObjectBoxState.objectBoxInstance!;

  Future<int> addRole(Role role) async{
    try{
      return objectBoxInstance.addRole(role);
    } catch(e){
      return Future.value(0);
    }
  }
   Future<List<Role>> getAllRole() async{
    try{
      return Future.value(objectBoxInstance.getAllRole());
    } catch(e){
      throw Exception("Error in getting all Roles.");
    }
  }

}