import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SignInSignUpController> {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SigninView'),
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
              child: Center(child: Text("Sign In")),
            ),
            onPressed: () => AuthController.to
              ..signIn(
                controller.email.text,
                controller.password.text,
              )
              ..closeKeyboard(context),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const SizedBox(
              height: 50,
              width: 100,
              child: Center(child: Text("Sign In Google")),
            ),
            onPressed: () => AuthController.to
              ..signInGoogle()
              ..closeKeyboard(context),
          ),
          const SizedBox(height: 20),
          TextButton(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Sign Up"),
            ),
            onPressed: () => Get.toNamed(Routes.SIGNUP),
          ),
        ],
      ),
    );
  }
}
