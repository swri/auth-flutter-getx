import 'package:fire_get/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/userapi_controller.dart';

class UserapiView extends GetView<UserapiController> {
  const UserapiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserapiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'UserapiView is working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => AuthController.to.signOut(),
              child: const SizedBox(
                width: 100,
                height: 50,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.logout,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
