import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text('Enter your phone number'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Whatsapp will need to verify your number',
              style: TextStyle(color: textColor),
            ),
            SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: Text(
                'Pick Country',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                ],
              ),
            )
          ],
        ),
    );
  }
}
