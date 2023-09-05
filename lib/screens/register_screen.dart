import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'qrScanner/qr_scan_screen.dart';
import 'captureImages/front_pic_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers for text fields
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();

  void _navigateToFrontPicScreen() async {
    // Navigate to FrontPicScreen to take a picture
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FrontPicScreen(
          fnameController: fnameController,
          lnameController: lnameController,
          emailController: emailController,
          linkedInController: linkedInController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EFEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5952A3),
        title: const Text('Register App'),
        actions: [
          IconButton(
            onPressed: () {
              Amplify.Auth.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset(
                    'assets/ServerlessDayLogo_png.png',
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: const Text(
                    'Sign up for Serverless Days Registration',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: TextField(
                    autofocus: true,
                    controller: fnameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                        color: Color(0xFF5952A3), // Color of the label text
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: TextField(
                    controller: lnameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                        color: Color(0xFF5952A3),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xFF5952A3),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        child: TextField(
                          controller: linkedInController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            labelText: 'LinkedIn Url',
                            labelStyle: TextStyle(
                              color: Color(0xFF5952A3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: MaterialButton(
                        onPressed: () => _navigateToScanPage(context),
                        color: const Color(0xFFCD2990),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                        shape: const CircleBorder(),
                        child: const Icon(Icons.qr_code),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFCD2990)),
                    ),
                    onPressed: () {
                      // print(fnameController.text);
                      // print(lnameController.text);
                      // print(emailController.text);
                      // print(linkedInController.text);

                      // Navigate to FrontPicScreen to take a picture
                      _navigateToFrontPicScreen();
                    },
                    child: const Text('Proceed'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToScanPage(BuildContext context) async {
    // Navigate to QRScanPage to scan the QR code
    String? qrResult = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRScanScreen()),
    );

    if (qrResult != null) {
      // Show the scanned QR code for 1 second
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('QR Code Scanned'),
            content: Text('Scanned Link: $qrResult'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Close the dialog and return to the main screen
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFFCD2990)),
                ),
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      // Wait for 1 second before updating the LinkedIn text field
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        linkedInController.text = qrResult;
      });
    }
  }
}
