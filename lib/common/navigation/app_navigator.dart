import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:workouts/common/navigation/app_page.dart';

class AppNavigatorException implements Exception {
  AppNavigatorException(this.message);

  final String message;
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    required this.initPath,
    required this.child,
    super.key,
  });

  final Uri initPath;
  final Widget child;

  static AppNavigatorState of(BuildContext context, {bool rootNavigator = false}) {
    AppNavigatorState? navigatorState;
    if (context is StatefulElement && context.widget is AppNavigatorState) {
      navigatorState = context.state as AppNavigatorState;
    }
    if (rootNavigator) {
      navigatorState = context.findRootAncestorStateOfType<AppNavigatorState>();
    } else {
      navigatorState = context.findAncestorStateOfType<AppNavigatorState>();
    }
    assert(navigatorState != null, AppNavigatorException('В этом контексте нет навигатора'));
    return navigatorState!;
  }

  static List<Page<Object?>> buildAndReduceOf(BuildContext context, {required Uri uri}) {
    Map<String, Page> pages = {};

    for (final segment in uri.pathSegments) {
      if (segment.isEmpty) continue;
      try {
        pages[segment] = AppPage.fromPath(segment);
      } on Object catch (error, stackTrace) {
        l.e(error, stackTrace);
      }
    }

    return pages.values.toList();
  }

  @override
  State<AppNavigator> createState() => AppNavigatorState();
}

typedef NavigatorPages = List<Page<Object?>>;

class AppNavigatorState extends State<AppNavigator> {
  late NavigatorPages _pages;

  NavigatorPages get pages => _pages;

  @override
  void initState() {
    super.initState();
    _pages = AppNavigator.buildAndReduceOf(context, uri: widget.initPath);
  }

  @override
  void didUpdateWidget(covariant AppNavigator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initPath != widget.initPath) {
      _pages = AppNavigator.buildAndReduceOf(context, uri: widget.initPath);
    }
  }

  void addPageNamed(String name) {
    setState(() {
      _pages.add(AppPage.fromPath(name));
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
