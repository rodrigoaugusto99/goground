import 'package:flutter/material.dart';
import 'package:goground/utils/helpers.dart';

class ShapeGrid extends StatefulWidget {
  const ShapeGrid({super.key});

  @override
  State<ShapeGrid> createState() => _ShapeGridState();
}

class _ShapeGridState extends State<ShapeGrid> {
  bool myBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shape Grid'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() {
          myBool = !myBool;
        }),
        label: const Text('Toggle Shape'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 40,
        itemBuilder: (BuildContext context, int index) {
          int duration = index * 55;
          double borderRadius = myBool ? 100.0 : 10.0;
          // var shape = BoxShape.circle;
          // if (myBool) {
          //   shape = index % 2 == 0 ? BoxShape.circle : BoxShape.rectangle;
          // } else {
          //   shape = index % 2 == 0 ? BoxShape.rectangle : BoxShape.circle;
          // }

          return AnimatedContainer(
            duration: Duration(milliseconds: duration),
            curve: Curves.easeInCirc,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(borderRadius),
              //shape: shape,
              color: Colors.blue,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          );
        },
      ),
    );
  }
}
