import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:goground/utils/helpers.dart';
import 'package:stacked/stacked.dart';

import 'test2_viewmodel.dart';

class Test2View extends StackedView<Test2ViewModel> {
  const Test2View({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    Test2ViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  @override
  Test2ViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      Test2ViewModel();
}
