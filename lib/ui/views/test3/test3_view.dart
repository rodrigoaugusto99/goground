import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goground/ui/views/test3/animations/animated_align.dart';
import 'package:goground/ui/views/test3/animations/animated_list.dart';
import 'package:goground/ui/views/test3/animations/animated_size.dart';
import 'package:goground/ui/views/test3/animations/animated_text.dart';
import 'package:goground/ui/views/test3/animations/change_padding.dart';
import 'package:goground/ui/views/test3/animations/change_position.dart';
import 'package:goground/ui/views/test3/animations/cross_fade.dart';
import 'package:goground/ui/views/test3/animations/is_expanded.dart';
import 'package:goground/ui/views/test3/animations/is_visible.dart';
import 'package:goground/utils/helpers.dart';
import 'package:stacked/stacked.dart';

import 'test3_viewmodel.dart';

class Test3View extends StackedView<Test3ViewModel> {
  const Test3View({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    Test3ViewModel viewModel,
    Widget? child,
  ) {
    Widget widget(Widget child) {
      return decContainer(
        radius: 12,
        allPadding: 20,
        color: Colors.amberAccent,
        child: child,
      );
    }

    //todo: cool/animated widgets

    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(),
          ),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white.withAlpha(200),
        title: styledText(text: 'Titulo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                AnimatedContainerExample(),
                AnimatedOpacityExample(),
                AnimatedPaddingExample()
              ],
            ),
            const AnimatedPositionedExample(),
            const AnimatedCrossFadeExample(),
            const AnimatedSizeExample(),
            const AnimatedAlignExample(),
            const TextStyleAnimation(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedListSample()),
                );
              },
              child: const Text('animated list'),
            ),
            decContainer(
              radius: 12,
              allMargin: 10,
              height: 100,
              color: Colors.deepPurple,
            ),
            decContainer(
              radius: 12,
              allMargin: 10,
              height: 100,
              color: Colors.deepPurple,
            ),
            decContainer(
              radius: 12,
              allMargin: 10,
              height: 100,
              color: Colors.deepPurple,
            ),
            decContainer(
              radius: 12,
              allMargin: 10,
              height: 100,
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Test3ViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      Test3ViewModel();
}
