import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInSignUpController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();

    super.onClose();
  }
}
