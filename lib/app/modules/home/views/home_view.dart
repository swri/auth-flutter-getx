import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../controllers/auth_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AuthController.to.user?.uid ?? "No Firebase User"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.GETAPI),
              child: const SizedBox(
                width: 100,
                height: 50,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.navigate_next_rounded,
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
