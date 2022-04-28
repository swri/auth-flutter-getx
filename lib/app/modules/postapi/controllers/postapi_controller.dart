import 'package:get/get.dart';

class PostapiController extends GetxController {
  int count = 0;

  increment() {
    count++;
    update();
  }
}
