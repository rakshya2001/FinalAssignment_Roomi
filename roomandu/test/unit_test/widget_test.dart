import 'package:flutter_test/flutter_test.dart';
import 'package:roomandu/app/constants.dart';
import 'package:roomandu/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:roomandu/model/user.dart';
import 'package:roomandu/repository/user_repo.dart';

void  main() {
  test('User should be able to login', () async{
    bool expectedResult = true;
    String username="Rakshya";
    String password="rakshya123";
    bool actualResult= await UserRepositoryImp().login(username,password);

    expect(expectedResult, actualResult);
    
  });

  
}

