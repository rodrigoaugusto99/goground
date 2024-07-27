import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goground/utils/helpers.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 100,
      // stretchTriggerOffset: 1000,
      expandedHeight: 275,
      // backgroundColor: Colors.deepPurple.withOpacity(0.4),
      pinned: false,
      elevation: 0.0,
      stretch: false,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'lib/assets/images/foto_comida.jpg',
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        title: const Text('Sliver App Bar'),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      leadingWidth: 80,
      leading: decContainer(
        leftMargin: 20,
        topMargin: 20,
        bottomMargin: 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: decContainer(
              height: 10,
              width: 10,
              alignment: Alignment.center,
              color: Colors.white.withOpacity(0.2),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
