import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/authentication/new_pass_screen.dart';
import 'package:wheelsndeels/UI/authentication/otp_screen.dart';
import 'package:wheelsndeels/UI/authentication/registration_screen.dart';
import 'package:wheelsndeels/UI/onBoarding/onbording_screen.dart';
import 'package:wheelsndeels/UI/onBoarding/splash_screen.dart';

import '../UI/authentication/login_screen.dart';
import '../UI/authentication/reset_pass.dart';
import '../UI/home/bottom_navbar.dart';
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
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/resetPass':
        return MaterialPageRoute(builder: (_) => ResetPassScreen());

      case '/otpScreen':
        final arguments = settings.arguments as String?;
        return MaterialPageRoute(
            builder: (_) => OTPScreen(
                  signupOption: arguments ?? "",
                ));
      case '/newPass':
        return MaterialPageRoute(builder: (_) => NewPasswordScreen());

      case '/bottomNavbar':
        return MaterialPageRoute(builder: (_) => BottomNavBar());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
