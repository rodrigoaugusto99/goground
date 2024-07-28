import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goground/utils/helpers.dart';

class PaddingGrid extends StatefulWidget {
  const PaddingGrid({super.key});

  @override
  State<PaddingGrid> createState() => _PaddingGridState();
}

class _PaddingGridState extends State<PaddingGrid> {
  bool myBool = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() {
          myBool = !myBool;
        }),
        label: const Text('wow'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 40,
        itemBuilder: (BuildContext context, int index) {
          int duration = index * 35;
          double padding = myBool ? index * 0.5 : (40 - index) * 0.5;

          return AnimatedContainer(
            padding: EdgeInsets.all(padding),
            color: Colors.blue,
            curve: Curves.easeInCirc,
            duration: Duration(milliseconds: duration),
            child: decContainer(color: Colors.white),
          );
        },
      ),
    );
  }
}
