import 'package:roomandu/helper/objectbox.dart';
import 'package:roomandu/state/objectbox_state.dart';

class RoleDataSource{
  ObjectBoxInstance get objectBoxInstance=> ObjectBoxState.objectBoxInstance!;
}