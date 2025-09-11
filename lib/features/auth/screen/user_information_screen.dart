import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whatsapp/common/utils/colors.dart';
import 'package:whatsapp/common/utils/image_picker.dart';

class UserInformationScreen extends StatefulWidget {
  static const String routeName = '/user-information-screen';
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  File? image;

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Stack(
                children: [
                  image == null
                      ? CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/profile_avatar.png'),
                          radius: 60,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(image!),
                          radius: 60,
                        ),
                  Positioned(
                    top: 80,
                    left: 75,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(Icons.add_a_photo,
                          color: Colors.white, size: 25),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: size.width * 0.75,
                      child: TextField(
                        controller: _nameTEController,
                        decoration:
                            InputDecoration(hintText: 'Enter Your Name'),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check, color: Colors.white, size: 25),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
