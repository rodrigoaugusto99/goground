import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:goground/ui/common/app_colors.dart';
import 'package:goground/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: viewModel.nav,
              child: const Text('nav'),
            ),
            ElevatedButton(
              onPressed: viewModel.nav2,
              child: const Text('nav2'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
