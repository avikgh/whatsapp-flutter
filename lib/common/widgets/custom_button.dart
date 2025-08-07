import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.childText, required this.onPressedButton});

  final String childText;
  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedButton,
      style: ElevatedButton.styleFrom(
        backgroundColor: tabColor,
        foregroundColor: blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
      child: Text(childText),
    );
  }
}
