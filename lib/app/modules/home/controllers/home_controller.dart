import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animation;

  bool isAnimated = false;

  @override
  void onInit() {
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    super.onInit();
  }

  @override
  void onClose() {
    animation.dispose();
    super.onClose();
  }

  void moveAnimation() {
    if (isAnimated) {
      animation.reverse();
    } else {
      animation.forward();
    }
    isAnimated = !isAnimated;
    update();
  }
}
