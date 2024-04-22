
import 'package:cash_control/constants/colors.dart';
import 'package:cash_control/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.color4,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Icon(
                            Icons.email,
                            size: 50,
                            color: AppColors.color3,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Mot de passe oublié?',
                        style: TextStyle(
                          color: AppColors.color4,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Entrez votre adresse email pour réinitialiser votre mot de passe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.color4,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email, color: AppColors.color3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          // Handle password reset logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.color3,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Réinitialiser',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ), //MaterialPageRoute
                    );
                        },
                        child: Text(
                          'Vous vous souvenez de votre mot de passe ?',
                          style: TextStyle(
                            color: AppColors.color3,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}