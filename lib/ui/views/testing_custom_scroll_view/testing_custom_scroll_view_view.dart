import 'package:flutter/material.dart';
import 'package:goground/ui/views/testing_custom_scroll_view/my_app_bar.dart';
import 'package:goground/ui/views/testing_custom_scroll_view/my_app_bar2.dart';
import 'package:goground/utils/helpers.dart';
import 'package:stacked/stacked.dart';

import 'testing_custom_scroll_view_viewmodel.dart';

class TestingCustomScrollViewView
    extends StackedView<TestingCustomScrollViewViewModel> {
  const TestingCustomScrollViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TestingCustomScrollViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const MyAppBar(),
          SliverToBoxAdapter(
            child: decContainer(
              height: 400,
              color: const Color.fromARGB(255, 114, 59, 207),
              allMargin: 10,
              radius: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: decContainer(
              height: 400,
              color: Colors.deepPurple[300],
              allMargin: 10,
              radius: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: decContainer(
              height: 400,
              color: Colors.deepPurple[300],
              allMargin: 10,
              radius: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('lib/assets/images/foto_comida.jpg'),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  TestingCustomScrollViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TestingCustomScrollViewViewModel();
}
