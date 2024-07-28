import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goground/utils/helpers.dart';

class RandomGrid extends StatefulWidget {
  const RandomGrid({super.key});

  @override
  State<RandomGrid> createState() => _RandomGridState();
}

class _RandomGridState extends State<RandomGrid> {
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

          // int duration = 0;
          // if (index <= 4) {
          //   duration = 300;
          // } else if (index <= 9) {
          //   duration = 400;
          // } else if (index <= 14) {
          //   duration = 500;
          // } else if (index <= 19) {
          //   duration = 600;
          // } else if (index <= 24) {
          //   duration = 700;
          // } else if (index <= 29) {
          //   duration = 800;
          // } else if (index <= 34) {
          //   duration = 900;
          // } else if (index <= 39) {
          //   duration = 1000;
          // }
          return AnimatedOpacity(
            //opacity: Random().nextBool() ? 1 : 0.2,
            opacity: myBool ? 1 : 0.2,
            //padding: EdgeInsets.all(padding),
            //color: Colors.blue,
            curve: Curves.easeInCirc,
            duration: Duration(milliseconds: duration),
            child: decContainer(color: Colors.black),
          );
        },
      ),
    );
  }
}
