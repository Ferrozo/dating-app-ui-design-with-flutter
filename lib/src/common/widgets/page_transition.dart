import 'package:flutter/material.dart';

class PageTransition extends StatelessWidget {
  const PageTransition({
    super.key,
    required this.child,
    required this.durationValue,
    required this.offset,
  });

  final Widget child;
  final double offset;
  final int durationValue;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: durationValue),
      tween: Tween(begin: 1.0, end: 0.0),
      builder: ((context, value, child) {
        return Transform.translate(
          offset: Offset(
            0.0,
            value * offset,
          ),
          child: child,
        );
      }),
      child: child,
    );
  }
}
