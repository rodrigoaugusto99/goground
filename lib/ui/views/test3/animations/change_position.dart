import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  _AnimatedPositionedExampleState createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      height: 200,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: _isMoved ? 100.0 : 0.0,
            top: _isMoved ? 100.0 : 0.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isMoved = !_isMoved;
                });
              },
              child: Container(
                color: Colors.blue,
                child: const FlutterLogo(size: 100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
