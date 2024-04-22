
import 'package:flutter/material.dart';

class ZoomInverseWidget extends StatefulWidget {
  final Widget child;
  final Widget destinationScreen;

  const ZoomInverseWidget({super.key, required this.child, required this.destinationScreen});

  @override
  // ignore: library_private_types_in_public_api
  _ZoomInverseWidgetState createState() => _ZoomInverseWidgetState();
}

class _ZoomInverseWidgetState extends State<ZoomInverseWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.destinationScreen),
          );
        });
      },
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}