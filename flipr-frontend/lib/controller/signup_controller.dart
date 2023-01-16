import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flipr/model/model_export.dart';
import 'package:flipr/utilities/utilities_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  Rx<int?> userId = 0.obs;
  Rx<bool> obscureText1 = false.obs;
  Rx<bool> obscureText2 = false.obs;

  Future<void> signUpUser(String name, String email, String password) async {
    var data = {"name": name, "email": email, "password": password};
    dio.Dio _dio = dio.Dio();
    try {
      dio.Response response = await _dio.post(
          AppConstants.userApiUrl + AppConstants.signUpApiMethod,
          data: data);
      if (response.statusCode == 200) {
        userId.value = userSignUpModelFromJson(json.encode(response.data))?.id;
        Get.back();
      }
      Get.showSnackbar(const GetSnackBar(
        title: "SignUp ",
        message: "Successful",
        snackPosition: SnackPosition.BOTTOM,
      ));
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        title: "Error while SignUp\nTry Again!",
        message: "Error in SignUp",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      ));
    }
  }
}
