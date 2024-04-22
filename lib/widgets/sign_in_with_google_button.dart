
import 'package:cash_control/constants/colors.dart';
import 'package:cash_control/constants/images.dart';
import 'package:flutter/material.dart';

class SignInWithGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInWithGoogleButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(AppImages.google_icon, height: 30),
      label: const Text(
        'Connexion avec Google',
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.color7,
        backgroundColor: AppColors.color9,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}