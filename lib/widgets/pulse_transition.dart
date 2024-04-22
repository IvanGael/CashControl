
import 'package:cash_control/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PulseTransition extends StatefulWidget {
  final Widget secondScreen;

  const PulseTransition({super.key, required this.secondScreen});

  @override
  // ignore: library_private_types_in_public_api
  _PulseTransitionState createState() => _PulseTransitionState();
}

class _PulseTransitionState extends State<PulseTransition>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the second screen once the animation is complete
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.secondScreen),
        );
      }
    });

    // Start the pulse animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: AppColors.color5,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SpinKitPulse(
                  size: 100,
                  itemBuilder: (_, int index){
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.color3,
                        shape: BoxShape.circle
                      )
                    );
                  },
                ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              "Un instant...",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}