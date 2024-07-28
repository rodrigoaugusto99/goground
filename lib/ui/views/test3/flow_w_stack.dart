import 'package:flutter/material.dart';
import 'package:goground/utils/helpers.dart';

class FlowWStack extends StatefulWidget {
  const FlowWStack({super.key});

  @override
  State<FlowWStack> createState() => _FlowWStackState();
}

class _FlowWStackState extends State<FlowWStack> {
  bool isShowingButtons = false;
  Curve curve = Curves.linearToEaseOut;
  Duration duration = const Duration(milliseconds: 400);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        clipBehavior: Clip.none,
        children: [
          decContainer(
            height: 150,
            width: 150,
            color: Colors.blue,
          ),
          AnimatedPositioned(
            right: isShowingButtons ? 100 : 0,
            bottom: 0,
            curve: curve,
            duration: duration,
            child: decContainer(
              onTap: () => setState(() {
                isShowingButtons = !isShowingButtons;
              }),
              height: 65,
              width: 65,
              radius: 100,
              color: Colors.green,
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            right: 0,
            curve: curve,
            bottom: isShowingButtons ? 100 : 0,
            child: decContainer(
              onTap: () => setState(() {
                isShowingButtons = !isShowingButtons;
              }),
              height: 65,
              width: 65,
              radius: 100,
              color: Colors.purple,
            ),
          ),
          AnimatedPositioned(
            curve: curve,
            duration: duration,
            right: isShowingButtons ? 75 : 0,
            bottom: isShowingButtons ? 75 : 0,
            child: decContainer(
              onTap: () => setState(() {
                isShowingButtons = !isShowingButtons;
              }),
              height: 65,
              width: 65,
              radius: 100,
              color: Colors.brown,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: decContainer(
              onTap: () => setState(() {
                isShowingButtons = !isShowingButtons;
              }),
              height: 65,
              width: 65,
              radius: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
