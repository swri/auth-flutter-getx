import 'package:get/get.dart';

import '../controllers/postapi_controller.dart';

class PostapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostapiController>(
      () => PostapiController(),
    );
  }
}
