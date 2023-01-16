import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flipr/bindings/bindings_export.dart';
import 'package:flipr/local_storage/local_storage_export.dart';
import 'package:flipr/model/model_export.dart';
import 'package:flipr/view/view_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<bool> obscureText = false.obs;
  final userLogin = UserLoginModel().obs;

  Future<UserLoginModel?> loginApp(String email, String password) async {
    var data = {"email": email, "password": password};
    dio.Dio _dio = dio.Dio();
    try {
      dio.Response response = await _dio
          .post("http://165.232.182.158/users/login-user", data: data);
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        if (response.data["Error"] == "Password Incorrect!") {
          Get.showSnackbar(GetSnackBar(
            title: "Error while Login",
            message: "Password Incorrect",
            duration: Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            snackPosition: SnackPosition.BOTTOM,
          ));
        } else {
          userLogin.value = userLoginModelFromJson(json.encode(response.data))!;
          await HiveStorage.addPerson(
              userLogin.value.result?.first?.name,
              userLogin.value.result?.first?.email,
              userLogin.value.token,
              userLogin.value.result?.first?.id,
              true);
          Get.to(HomePage(), binding: HomeBinding());
        }
        return userLoginModelFromJson(json.encode(response.data));
      }
    } on dio.DioError catch (e) {
      if (e.type == dio.DioErrorType.response) {
        Get.to(SignUpPage());
        Get.showSnackbar(GetSnackBar(
          title: "Error while Login",
          message: "Try Again!",
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
        ));
      }
      Get.showSnackbar(GetSnackBar(
        title: "Error while Login",
        message: "Try Again!",
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      ));
    }
  }
}
