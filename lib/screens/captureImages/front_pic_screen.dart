import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../uploadPreview/preview_screen.dart';

class FrontPicScreen extends StatefulWidget {
  final TextEditingController fnameController;
  final TextEditingController lnameController;
  final TextEditingController emailController;
  final TextEditingController linkedInController;

  const FrontPicScreen({
    Key? key,
    required this.fnameController,
    required this.lnameController,
    required this.emailController,
    required this.linkedInController,
  }) : super(key: key);

  @override
  State<FrontPicScreen> createState() => _FrontPicScreenState();
}

class _FrontPicScreenState extends State<FrontPicScreen> {
  File? frontPic;

  Future<void> _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        frontPic = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EFEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5952A3),
        title: const Text('Front Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            frontPic == null
                ? const Text('No Image Selected')
                : Image.file(frontPic!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePicture,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFFCD2990)),
              ),
              child: const Text('Open Camera'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFFCD2990)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreviewScreen(
                      fnameController: widget.fnameController,
                      lnameController: widget.lnameController,
                      emailController: widget.emailController,
                      linkedInController: widget.linkedInController,
                      frontPic: frontPic, // Pass the frontPic to the LeftPicScreen
                    ),
                  ),
                );
              },
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
