import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import the lottie package

class SuccessAnimationScreen extends StatefulWidget {
  final VoidCallback onCompleted;

  const SuccessAnimationScreen({Key? key, required this.onCompleted}) : super(key: key);

  @override
  _SuccessAnimationScreenState createState() => _SuccessAnimationScreenState();
}

class _SuccessAnimationScreenState extends State<SuccessAnimationScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = Tween<double>(begin: 0.0, end: 3.0).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _playAnimation();
  }

  Future<void> _playAnimation() async {
    // Add any necessary delay before playing the animation (if needed)
    // await Future.delayed(const Duration(seconds: 1));

    // After the delay, you can play the Lottie animation here
    // Replace 'assets/success_animation.json' with the actual Lottie animation file path
    await _controller.forward();
    await Future.delayed(const Duration(seconds: 1)); // Wait for the animation to complete

    // Call the callback to notify the parent that the animation is completed
    widget.onCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/success_animation.json', controller: _controller, animate: false),
              const SizedBox(height: 20),
              const Text(
                  "Registration Successful!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: Colors.blue)
              ),
            ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
