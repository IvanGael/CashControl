
import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen2> {
  double _radius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildConcentricTransition(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildConcentricTransition() {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      width: _radius * 2,
      height: _radius * 2,
      onEnd: () {
        setState(() {
          _radius = _radius == 50.0 ? 150.0 : 50.0;
        });
      },
    );
  }

  Widget _buildContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to MyApp',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'This is a beautiful onboarding screen!',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to the next screen or perform any action
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}