import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goground/utils/helpers.dart';

class MyAppBar2 extends StatelessWidget {
  const MyAppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // stretchTriggerOffset: 1000,
      expandedHeight: 275,
      backgroundColor: Colors.black,
      pinned: true,
      elevation: 0.0,
      stretch: false,
      shadowColor: Colors.transparent, surfaceTintColor: Colors.transparent,
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        title: Text('Sliver App Bar'),
        // background: Image.asset(
        //   'lib/assets/images/foto_comida.jpg',
        //   fit: BoxFit.cover,
        // ),
        stretchModes: [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(0.0),
      //   child: decContainer(
      //     alignment: Alignment.center,
      //     height: 32,
      //     color: Colors.white,
      //     topLeftRadius: 32,
      //     topRightRadius: 32,
      //     child: decContainer(
      //       width: 40,
      //       height: 5,
      //       color: Colors.grey,
      //       radius: 100,
      //     ),
      //   ),
      // ),
      leadingWidth: 80,
      leading: decContainer(
        leftMargin: 24,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: decContainer(
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
