import 'package:flutter/material.dart';
import 'package:whatsapp/common/widgets/error_screen.dart';
import 'package:whatsapp/features/auth/screen/login_screen.dart';
import 'package:whatsapp/features/auth/screen/otp_screen.dart';
import 'package:whatsapp/features/auth/screen/user_information_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (context) => UserInformationScreen(),);
    case OTPScreen.routeName:
      return MaterialPageRoute(builder: (context) => OTPScreen(),);
    default:
      return MaterialPageRoute(
        builder: (context) => ErrorScreen(
          error: 'This page doesn\'t exists',
        ),
      );
  }
}
