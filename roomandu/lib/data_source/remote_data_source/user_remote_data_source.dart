import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:roomandu/app/constants.dart';
import 'package:roomandu/helper/http_service.dart';
import 'package:roomandu/model/user.dart';
import 'package:http_parser/http_parser.dart';

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
        "password" : user.password,
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
        Constant.token = "Bearer ${response.data['token']}";
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
