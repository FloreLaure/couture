import 'package:flutter/material.dart';
import 'dart:async';

class PageAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  const PageAnimation(
      {super.key, required this.delay, required this.child, required colors});

  @override
  State<PageAnimation> createState() => PageAnimationState();
}

class PageAnimationState extends State<PageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animOffset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    animOffset = Tween<Offset>(
      begin: const Offset(0.0, -0.35),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: SlideTransition(
        position: animOffset,
        child: widget.child,
      ),
    );
  }
}
