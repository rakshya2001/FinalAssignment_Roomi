import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:roomandu/app/constants.dart';
import 'package:roomandu/data_source/remote_data_source/response/user_login_response.dart';
import 'package:roomandu/data_source/remote_data_source/response/user_reponse.dart';
import 'package:roomandu/helper/http_service.dart';
import 'package:roomandu/model/user.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<int> registerUser(File? file, User user) async {
    try {
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);
        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType("image", mimeType!.split('/')[1]),
        );
      }
      FormData formData = FormData.fromMap({
        "firstname": user.firstName,
        "lastname": user.lastName,
        "username": user.username,
        "phone": user.phoneNumber,
        "password": user.password,
        "email": user.email,
        'profile': image,
      });

      final response = await _httpServices.post(
        Constant.userRegisterURL,
        data: formData,
      );
      if (response.statusCode == 201) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      Response response = await _httpServices.post(
        Constant.userLoginURL,
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Constant.userid = loginResponse.userid!;
        prefs.setString('token', Constant.token);
        print(loginResponse.userid!);
        prefs.setString('userId', loginResponse.userid!);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<User>?> getuser(String userid) async {
    try {
      Response response = await _httpServices.get(
        Constant.user + userid,
      );
      if (response.statusCode == 200) {
        UserResponse userResponse = UserResponse.fromJson(response.data);
  print(userResponse.data);
        return userResponse.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future <List<User>?> getalluser() async {
    try {
      Response response = await _httpServices.get(
        Constant.user,
      );
      if (response.statusCode == 200) {
        UserResponse userResponse = UserResponse.fromJson(response.data);
        print(userResponse.data);
        return userResponse.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
