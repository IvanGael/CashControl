import 'dart:math';

import 'package:cash_control/constants/colors.dart';
import 'package:cash_control/screens/auth/login/login_screen.dart';
import 'package:cash_control/widgets/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> titles = [
    'Suivez les dépenses',
    'Fixez des objectifs budgétaires',
    'Visualisez les dépenses',
  ];

  final List<String> descriptions = [
    'Suivez sans effort vos dépenses quotidiennes et comprenez vos habitudes de dépenses.',
    'Fixez-vous des objectifs budgétaires réalisables et gérez vos finances plus efficacement.',
    'Visualisez vos habitudes de dépenses avec des tableaux et des graphiques intuitifs.',
  ];

  final List<String> lottieAnimations = [
    'assets/animations/expense.json',
    'assets/animations/budget.json',
    'assets/animations/visualization.json',
  ];

  late LiquidController liquidController;
  int page = 0;

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.color5,
      body: SafeArea(
          child: Stack(
        children: [
          LiquidSwipe(
              pages: List.generate(
                titles.length,
                (index) => OnboardingPage(
                  title: titles[index],
                  description: descriptions[index],
                  lottieAnimation: lottieAnimations[index],
                ),
              ),
              liquidController: liquidController,
              onPageChangeCallback: pageChangeCallback,
              positionSlideIcon: 0.8,
              fullTransitionValue: 880,
              slideIconWidget:
                  Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.primary),
              waveType: WaveType.liquidReveal,
              enableLoop: false),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(titles.length, _buildDot),
                ),
              ],
            ),
          ),
          if (page != 2)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  onPressed: () {
                    liquidController.animateToPage(
                        page: titles.length - 1, duration: 200);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor: AppColors.color5
                  ),
                  child: const Text("Passer >>"),
                ),
              ),
            ),
          if (page == 2)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // liquidController.jumpToPage(
                    //     page: liquidController.currentPage + 1 > titles.length - 1
                    //         ? 0
                    //         : liquidController.currentPage + 1);
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isFirstTime', false);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ), //MaterialPageRoute
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.color3,
                      foregroundColor: AppColors.color5),
                  child: const Text("Commencer"),
                ),
              ),
            ),
        ],
      )),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String lottieAnimation;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.lottieAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
                color: AppColors.color9,
                borderRadius: BorderRadius.circular(12)),
            child: LottieAnimation(
              animationAsset: lottieAnimation,
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
