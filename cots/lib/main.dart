import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/onboarding/bindings/onboarding_binding.dart';
import 'modules/onboarding/view/onboarding_view.dart';
import 'modules/login/bindings/login_binding.dart';
import 'modules/login/view/login_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/onboarding',
      debugShowCheckedModeBanner: false,
      getPages: [

        GetPage(
          name: '/onboarding',
          page: () => OnboardingView(),
          binding: OnboardingBinding(),
        ),

        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: LoginBinding(),
        ),

      ],
    );
  }
}

