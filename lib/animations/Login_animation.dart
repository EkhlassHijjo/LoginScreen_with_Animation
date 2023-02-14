import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum Animated { opacity, translateY }

class LoginAnimation extends StatelessWidget {
  const LoginAnimation(this.delay, this.child, {super.key});
  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<Animated>()
      ..add(Animated.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
      ..add(Animated.translateY, (-30.0).tweenTo(0.0), 500.milliseconds,
          Curves.easeOut);
    return PlayAnimation<MultiTweenValues<Animated>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(Animated.opacity),
        child: Transform.translate(
            offset: Offset(0, value.get(Animated.translateY)), child: child),
      ),
    );
  }
}
