import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/colors.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error, style: TextStyle(
          color: blackColor
        ),),
      ),
    );
  }
}
