import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:workouts/common/navigation/app_pages.dart';
import 'package:workouts/common/navigation/observers.dart';

typedef NavigatorPages = List<Page<Object?>>;

class AppNavigatorException implements Exception {
  AppNavigatorException(this.message);

  final String message;

  @override
  String toString() => 'AppNavigatorException: $message';
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    required this.initPath,
    required this.child,
    required this.pageObserver,
    super.key,
  });

  final String? initPath;
  final Widget child;
  final PageObserver pageObserver;

  NavigatorState? get navigator => pageObserver.navigator;

  static const String defaultRouteName = '/';

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
    assert(() {
      if (navigatorState == null) {
        throw AppNavigatorException('В этом контексте нет навигатора');
      }
      return true;
    }());
    return navigatorState!;
  }

  static NavigatorPages pagesOf(BuildContext context) => AppNavigator.of(context).pages;

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    final navigator = of(context).widget.navigator;
    if (navigator == null) {
      Navigator.pop(context, result);
    } else {
      navigator.pop(result);
    }
  }

  static bool canPop(BuildContext context) {
    final navigator = of(context).widget.navigator;
    if (navigator == null) {
      return Navigator.canPop(context);
    } else {
      return navigator.canPop();
    }
  }

  static Future<bool> maybePop<T extends Object?>(BuildContext context, [T? result]) {
    final navigator = of(context).widget.navigator;
    if (navigator == null) {
      return Navigator.maybePop(context, result);
    } else {
      return navigator.maybePop(result);
    }
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

class AppNavigatorState extends State<AppNavigator> {
  late NavigatorPages _pages;

  NavigatorPages get pages => _pages;

  @override
  void initState() {
    super.initState();
    _pages = AppNavigator.buildAndReduceOf(context,
        uri: Uri.parse(widget.initPath ?? AppNavigator.defaultRouteName));
  }

  @override
  void didUpdateWidget(covariant AppNavigator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initPath != widget.initPath) {
      _pages = AppNavigator.buildAndReduceOf(
        context,
        uri: Uri.parse(
          widget.initPath ?? AppNavigator.defaultRouteName,
        ),
      );
    }
  }

  void pushNamed(String name) {
    setState(() {
      _pages = [AppPage.fromPath(name)];
    });
  }

  void buildFromPath(String path) {
    final Uri uriPath = Uri.parse(path);
    setState(() {
      _pages = AppNavigator.buildAndReduceOf(context, uri: uriPath);
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
