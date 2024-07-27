import 'package:flutter/material.dart';

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  _AnimatedPaddingExampleState createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double _padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _padding = _padding == 10.0 ? 50.0 : 10.0;
        });
      },
      child: Container(
        color: Colors.red,
        child: AnimatedPadding(
          curve: Curves.bounceOut,
          duration: const Duration(seconds: 1),
          padding: EdgeInsets.all(_padding),
          child: Container(
            color: Colors.blue,
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
