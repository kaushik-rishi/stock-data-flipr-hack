import 'package:flipr/controller/controllers_export.dart';
import 'package:flipr/view/view_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (controller.isLogin.value) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
