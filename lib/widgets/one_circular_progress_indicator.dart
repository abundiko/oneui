import 'package:flutter/material.dart';

class OneCircularProgressIndicator extends StatefulWidget {
  const OneCircularProgressIndicator({super.key, this.color});

  ///defines the primary color
  final Color? color;

  @override
  State<OneCircularProgressIndicator> createState() =>
      _OneCircularProgressIndicatorState();
}

class _OneCircularProgressIndicatorState
    extends State<OneCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = widget.color ?? Theme.of(context).primaryColor;
    return Transform.scale(
      scale: 0.8,
      child: SizedBox(
        height: 50,
        width: 50,
        child: RotationTransition(
            turns: _animationController,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 50),
              color: color,
              height: 50,
              width: 50,
            )),
      ),
    );
  }
}
