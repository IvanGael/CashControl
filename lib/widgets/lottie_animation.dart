
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class LottieAnimation extends StatelessWidget {
  final String animationAsset;
  final double width;
  final double height;
  const LottieAnimation({super.key, required this.animationAsset, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animationAsset,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}