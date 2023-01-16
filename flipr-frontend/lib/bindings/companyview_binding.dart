import 'package:get/get.dart';

import '../controller/controllers_export.dart';

class CompanyViewBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CompanyController>(() => CompanyController());
  }
}
