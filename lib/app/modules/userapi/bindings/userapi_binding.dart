import 'package:get/get.dart';

import '../controllers/userapi_controller.dart';

class UserapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserapiController>(
      () => UserapiController(),
    );
  }
}
