import 'package:flutter/material.dart';

class TextStyleAnimation extends StatefulWidget {
  const TextStyleAnimation({super.key});

  @override
  _TextStyleAnimationState createState() => _TextStyleAnimationState();
}

class _TextStyleAnimationState extends State<TextStyleAnimation> {
  bool _firstStyle = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 1),
          style: _firstStyle
              ? const TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
              : const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
          child: const Text('Flutter Animation'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _firstStyle = !_firstStyle;
            });
          },
          child: const Text('Animate Text Style'),
        ),
      ],
    );
  }
}
