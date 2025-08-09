import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/colors.dart';
import 'package:whatsapp/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneTEController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _phoneTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
          const SizedBox(height: 10),
          const Text(
            'Whatsapp will need to verify your number',
            style: TextStyle(color: textColor),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: Text(
              'Pick Country',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Text("+88"),
                SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    controller: _phoneTEController,
                    decoration: InputDecoration(hintText: 'phone number'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: size.height * 0.6),
          SizedBox(
            height: 50,
            width: size.width * 0.3,
            child: CustomButton(childText: 'NEXT', onPressedButton: () {}),
          )
        ],
      ),
    );
  }
}
