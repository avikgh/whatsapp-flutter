import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common/utils/colors.dart';
import 'package:whatsapp/common/widgets/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';
import 'package:whatsapp/common/utils/snackbar.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneTEController = TextEditingController();
  Country? _country;

  @override
  void dispose() {
    super.dispose();
    _phoneTEController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _country = country;
        });
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = _phoneTEController.text.trim();
    if(_country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${_country!.phoneCode}$phoneNumber');
    } else {
      showSnackbar(context, 'Fill out all the fields');
    }
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
      body: SingleChildScrollView(
        child: Column(
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
              onPressed: pickCountry,
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
                  if (_country != null)
                    Text(
                      '+${_country!.phoneCode}',
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: size.width * 0.6,
                    child: TextField(
                      controller: _phoneTEController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'phone number'),
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.6),
            SizedBox(
              height: 50,
              width: size.width * 0.3,
              child: CustomButton(
                childText: 'NEXT',
                onPressedButton: sendPhoneNumber,
              )
            )
          ],
        ),
      ),
    );
  }
}
