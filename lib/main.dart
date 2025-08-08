import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp/common/utils/colors.dart';
import 'package:whatsapp/features/landings/screens/landing_screen.dart';
import 'package:whatsapp/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: appBarColor,
              titleTextStyle: TextStyle(
                  color: textColor, fontSize: 20, fontWeight: FontWeight.w600),
              titleSpacing: 0),
          iconButtonTheme: IconButtonThemeData(
              style: IconButton.styleFrom(foregroundColor: textColor)),
          inputDecorationTheme:
              InputDecorationTheme(hintStyle: TextStyle(color: greyColor))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: LandingScreen(),
    );
  }
}
