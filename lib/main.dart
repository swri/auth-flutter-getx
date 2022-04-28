import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/controllers/bindings/auth_binding.dart';
import 'app/utils/error.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          FlutterNativeSplash.remove();
          return GetMaterialApp(
            title: "GetX Firebase",
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.teal,
              textTheme: GoogleFonts.nunitoTextTheme(),
            ),
            initialBinding: AuthBinding(),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        } else {
          return const ErrorPage();
        }
      },
    ),
  );
}
