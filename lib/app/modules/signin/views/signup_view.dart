import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/signin_controller.dart';

class SignupView extends GetView<SignInSignUpController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Email"),
            controller: controller.email,
          ),
          const SizedBox(height: 40),
          TextField(
            decoration: const InputDecoration(hintText: "Password"),
            obscureText: true,
            controller: controller.password,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            child: const SizedBox(
              height: 50,
              width: 100,
              child: Center(
                child: Text("Sign Up"),
              ),
            ),
            onPressed: () => AuthController.to
              ..signUp(
                controller.email.text,
                controller.password.text,
              )
              ..closeKeyboard(context),
          ),
          const SizedBox(height: 30),
          TextButton(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Check Account"),
            ),
            onPressed: () => Get.defaultDialog(
              title: AuthController.to.user?.email ?? "No Data",
              middleText: AuthController.to.user?.uid ?? "No ID",
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
