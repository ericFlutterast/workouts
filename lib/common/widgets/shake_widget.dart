import 'package:flutter/material.dart';

@immutable
final class ShakeWidget extends StatelessWidget {
  const ShakeWidget({
    super.key,
    this.child,
    this.curve = Curves.easeInSine,
    this.duration = const Duration(milliseconds: 400),
    this.deltaY = 5.0,
  });

  final Widget? child;
  final Curve curve;
  final Duration duration;
  final double deltaY;

  double _shake(double animation) {
    return 2 * (0.5 - (0.5 - curve.transform(animation)).abs());
  }

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
        key: key,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: duration,
        builder: (context, animation, child) => Transform.translate(
          offset: Offset(
            deltaY * _shake(animation),
            -deltaY * _shake(animation),
          ),
          child: child!,
        ),
        child: child,
      );
}
