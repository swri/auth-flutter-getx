import 'package:get/get.dart';

import '../controllers/getapi_controller.dart';

class GetapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetapiController>(
      () => GetapiController(),
    );
  }
}
