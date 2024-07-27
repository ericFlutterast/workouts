import 'package:flutter/material.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({
    super.key,
    this.builder,
    this.child,
  });

  final Widget Function()? builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [],
      onPopPage: (rout, date) {
        //TODO:
        return true;
      },
    );
  }
}
