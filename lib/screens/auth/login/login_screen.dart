
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cash_control/constants/colors.dart';
import 'package:cash_control/constants/images.dart';
import 'package:cash_control/screens/auth/forgotpassword/forgot_password_screen.dart';
import 'package:cash_control/screens/auth/register/signup_screen.dart';
import 'package:cash_control/screens/root/root_screen.dart';
import 'package:cash_control/widgets/pulse_transition.dart';
import 'package:cash_control/widgets/sign_in_with_google_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                            child: Image.asset(
                          AppImages.login_icon,
                          fit: BoxFit.contain,
                          width: 80,
                          height: 80,
                        )),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Se connecter',
                        style: TextStyle(
                          color: AppColors.color4,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon:
                              Icon(Icons.person, color: AppColors.color3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Mot de passe',
                          prefixIcon: Icon(Icons.lock, color: AppColors.color3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PulseTransition(
                                secondScreen: RootScreen(),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.color3,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Connexion',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Image.asset(
                              AppImages.enter_icon,
                              fit: BoxFit.contain,
                              width: 20,
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ), //MaterialPageRoute
                          );
                        },
                        child: Text(
                          'Mot de passe oublié?',
                          style: TextStyle(
                            color: AppColors.color3,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SignInWithGoogleButton(
                        onPressed: () {},
                      ),
                      const SizedBox(height: 10),
                      FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ), //MaterialPageRoute
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const PulseTransition(
                          //       secondScreen: SignUpScreen(),
                          //     ),
                          //   ),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Theme.of(context).colorScheme.background
                        ),
                        child: Text(
                          'Créer mon compte',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
  //     floatingActionButton: FloatingActionButton(
  //     onPressed: (){},
  //  ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  //     bottomNavigationBar: _buildBottomNavigationBar()
    );
  }

  int _currentIndex = 0;

  Widget _buildBottomNavigationBar() {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home,
        Icons.search,
        Icons.favorite,
        Icons.person,
      ],
      activeIndex: _currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        // Handle navigation based on the selected index
      },
    );
  }


  // Widget _buildBottomNavigationBar() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           spreadRadius: 1,
  //           blurRadius: 10,
  //           offset: const Offset(0, -2),
  //         ),
  //       ],
  //     ),
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
  //       child: Container(
  //         color: Colors.white.withOpacity(0.7),
  //         child: BottomNavigationBar(
  //           type: BottomNavigationBarType.fixed,
  //           selectedItemColor: Colors.blue,
  //           unselectedItemColor: Colors.grey,
  //           currentIndex: 0, // Change this to the current index
  //           items: const [
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.home),
  //               label: 'Home',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.search),
  //               label: 'Search',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.favorite),
  //               label: 'Favorites',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.person),
  //               label: 'Profile',
  //             ),
  //           ],
  //           onTap: (index) {
  //             // Handle navigation based on the selected index
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
