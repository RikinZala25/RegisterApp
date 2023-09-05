import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../amplifyconfiguration.dart';
import '../../models/ServerlessUsers.dart';
import '../animationScreens/failure_animation_screen.dart';
import '../animationScreens/success_animation_screen.dart';

class PreviewScreen extends StatelessWidget {
  final TextEditingController fnameController;
  final TextEditingController lnameController;
  final TextEditingController emailController;
  final TextEditingController linkedInController;
  final File? frontPic;

  const PreviewScreen({
    Key? key,
    required this.fnameController,
    required this.lnameController,
    required this.emailController,
    required this.linkedInController,
    required this.frontPic,
  }) : super(key: key);

  Future<void> uploadImagesToS3(String name, File file) async {
    try {
      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromPath(
          file.path,
        ),
        key: name,
      ).result;

      safePrint('Uploaded data to location: ${result.uploadedItem.key}');
    } on StorageException catch (e) {
      safePrint(e.message);
      _failureRegister(e);
    }
  }

  Future<void> uploadToDynamo(
      username, email, firstname, lastname, linkedinurl, objecturi) async {
    try {
      final task = ServerlessUsers(
          userName: username,
          email: email,
          firstName: firstname,
          lastName: lastname,
          linkedInURL: linkedinurl,
          objectURI: objecturi);
      final request = ModelMutations.create(task);
      final response = await Amplify.API.mutate(request: request).response;

      final uploadedToDynamo = response.data;
      if (uploadedToDynamo == null) {
        safePrint('errors: ${response.errors}');
        _failureRegister(e);
        return;
      }
      safePrint('Upload result: ${uploadedToDynamo.userName}');
    } on ApiException catch (e) {
      safePrint('Upload failed: $e');
      _failureRegister(e);
    }
  }

  Future<String?> fetchBucketName() async {
    try {
      // Read the amplifyconfiguration.json file
      const jsonString = amplifyconfig;
      final jsonData = json.decode(jsonString);

      // Extract the S3 bucket name
      final storageConfig = jsonData['storage'];
      final s3Config = storageConfig['plugins']['awsS3StoragePlugin'];
      final bucketName = s3Config['bucket'];

      return bucketName;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching bucket name: $e');
      }
      _failureRegister(e);
      return null;
    }
  }

  String generateRandomDigits(int length) {
    var random = Random();
    return List.generate(length, (index) => random.nextInt(10)).join();
  }

  void _completeRegister(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessAnimationScreen(
          onCompleted: () {
            // After the animation is completed, navigate back
            Navigator.pop(context);
            Navigator.pop(context);

            fnameController.clear();
            lnameController.clear();
            emailController.clear();
            linkedInController.clear();
          },
        ),
      ),
    );
  }

  void _failureRegister(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FailureAnimationScreen(
          onCompleted: () {
            // After the animation is completed, navigate back
            Navigator.pop(context);
            // Navigator.pop(context);
            //
            // fnameController.clear();
            // lnameController.clear();
            // emailController.clear();
            // linkedInController.clear();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String username =
        '${fnameController.text.trim()}_${lnameController.text.trim()}_dv${generateRandomDigits(4)}'
            .toLowerCase()
            .trim();

    return Scaffold(
      backgroundColor: const Color(0xFFF0EFEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5952A3),
        title: const Text('Preview'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPreviewRow('First Name', fnameController.text.trim(),
                fontSize: 20.0),
            _buildPreviewRow('Last Name', lnameController.text.trim(),
                fontSize: 20.0),
            _buildPreviewRow('Username', username.trim(), fontSize: 20.0),
            _buildPreviewRow('Email', emailController.text.trim(),
                fontSize: 20.0),
            _buildPreviewRow('LinkedIn Url', linkedInController.text.trim(),
                fontSize: 20.0),
            _buildImagePreviewRow('Front Picture', frontPic, imageSize: 200.0),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    // Amazon s3 bucket - images upload
                    final s3Uploads = Future.wait([
                      uploadImagesToS3("$username.jpg", frontPic!),
                    ]);

                    // Bucket Name
                    final bucketName = await fetchBucketName();
                    if (bucketName != null) {
                      if (kDebugMode) {
                        print(bucketName);
                      }
                    }

                    // URI Input
                    String uriName = "s3://$bucketName/public/$username.jpg";

                    // Amazon Dynamodb
                    final dynamoUpload = uploadToDynamo(
                        username.trim(),
                        emailController.text.trim(),
                        fnameController.text.trim(),
                        lnameController.text.trim(),
                        linkedInController.text.trim(),
                        uriName.trim());

                    await Future.wait([s3Uploads, dynamoUpload]);

                    // Success Animation
                    _completeRegister(context);
                  } catch (e) {
                    // Failure Animation
                    _failureRegister(context);
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFCD2990)),
                ),
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewRow(String title, String value,
      {double fontSize = 16.0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize, // Customize font size
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize, // Customize font size
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreviewRow(String title, File? imageFile,
      {double imageSize = 150.0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0, // Customize font size
            ),
          ),
          const SizedBox(height: 8),
          imageFile != null
              ? Image.file(
                  imageFile,
                  height: imageSize, // Customize image height
                  width: imageSize, // Customize image width
                )
              : const Text(
                  'No Image Selected',
                  style: TextStyle(
                    fontSize: 20.0, // Customize font size
                  ),
                ),
        ],
      ),
    );
  }
}
