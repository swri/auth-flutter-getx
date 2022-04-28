import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/postapi_controller.dart';

class PostapiView extends GetView<PostapiController> {
  const PostapiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostapiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<PostapiController>(
              builder: (s) => Text(
                'Counting to ${s.count}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.USERAPI),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
      ),
    );
  }
}
