import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../modules/getapi/bindings/getapi_binding.dart';
import '../modules/getapi/views/getapi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/postapi/bindings/postapi_binding.dart';
import '../modules/postapi/views/postapi_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signin/views/signup_view.dart';
import '../modules/userapi/bindings/userapi_binding.dart';
import '../modules/userapi/views/userapi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => AuthController.to.user != null
          ? const HomeView()
          : const SigninView(),
      binding: AuthController.to.user != null
          ? HomeBinding()
          : SignInSignUpBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
    ),
    GetPage(
      name: _Paths.USERAPI,
      page: () => const UserapiView(),
      binding: UserapiBinding(),
    ),
    GetPage(
      name: _Paths.POSTAPI,
      page: () => const PostapiView(),
      binding: PostapiBinding(),
    ),
    GetPage(
      name: _Paths.GETAPI,
      page: () => const GetapiView(),
      binding: GetapiBinding(),
    ),
  ];
}
