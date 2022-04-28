import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late Rx<User?> _user;
  User? get user => _user.value;

  @override
  void onInit() {
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.authStateChanges());
    ever(_user, _firebaseAuth);

    super.onInit();
  }

  _firebaseAuth(User? user) {
    if (Get.currentRoute != Routes.ROOT) {
      Get.offAllNamed(Routes.ROOT);
    }
  }

  Future<void> signInGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);
      Get.offAllNamed(Routes.ROOT);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      showSnackbar(e);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      Get.offAllNamed(Routes.ROOT);
    } on FirebaseAuthException catch (e) {
      showSnackbar(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackbar(e);
    }
  }

  closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  showSnackbar(FirebaseAuthException e) {
    Get.snackbar(
      e.code.capitalizeFirst!.replaceAll("-", " "),
      e.message!.capitalizeFirst.toString(),
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
