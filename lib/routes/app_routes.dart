import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/authentication/registration_screen.dart';
import 'package:wheelsndeels/UI/onBoarding/onbording_screen.dart';
import 'package:wheelsndeels/UI/onBoarding/splash_screen.dart';

import '../UI/notfound.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onBoarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/registration':
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
