import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  _AnimatedCrossFadeExampleState createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFirst = !_isFirst;
        });
      },
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        firstChild: Container(
          color: Colors.blue,
          height: 200,
          width: 200,
          child: const Center(
              child: Text('First',
                  style: TextStyle(color: Colors.white, fontSize: 24))),
        ),
        secondChild: Container(
          color: Colors.red,
          height: 200,
          width: 200,
          child: const Center(
              child: Text('Second',
                  style: TextStyle(color: Colors.white, fontSize: 24))),
        ),
        crossFadeState:
            _isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }
}
