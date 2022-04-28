import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SignInSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInSignUpController>(
      () => SignInSignUpController(),
    );
  }
}
