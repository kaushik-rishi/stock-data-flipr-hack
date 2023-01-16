import 'package:flipr/local_storage/hive_creator.dart';
import 'package:flipr/main.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Rx<bool> isLogin = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    checkLogin();
    super.onInit();
  }

  Future<bool> checkLogin() async {
    Person? hiveDB = await box.get("cache");
    if (hiveDB != null) {
      isLogin.value = hiveDB.isLogin;
    } else {
      isLogin.value = false;
    }
    return isLogin.value;
  }
}
