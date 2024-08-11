import 'package:flutter/material.dart';
import 'package:workouts/features/home/presentation/screens/home_screen.dart';
import 'package:workouts/features/workouts/presentation/screens/workout_screen.dart';

///Main page for app
abstract class AppPage<T> extends Page<T> {
  AppPage({
    required this.location,
    LocalKey? key,
    String? restorationId,
    this.fullscreenDialog = false,
    this.maintainState = true,
    this.settings,
    super.name,
    super.arguments,
  })  : assert(location.toLowerCase().trim() == location, 'предпологается нижний регистр адреса'),
        super(
          key: key ?? ValueKey(location),
          restorationId: restorationId ?? location,
        );

  static AppPage fromPath(String path) {
    return switch (path) {
      'home' => HomePage(),
      'workouts' => WorkoutsPage(),
      //'statistics' => StatisticsPAge(),
      //'profile' => ProfilePage(),
      _ => NotFoundPage(),
    };
  }

  final String location;
  final bool maintainState;
  final bool fullscreenDialog;
  final RouteSettings? settings;

  @override
  Route<T> createRoute(BuildContext context) => PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1200),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        settings: this,
        pageBuilder: (context, animation, _) => ScaleTransition(
          scale: Tween<double>(begin: .0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutBack,
            ),
          ),
          child: builder.call(context),
        ),
      );

  Widget builder(BuildContext context);
}

final class HomePage<T> extends AppPage<T> {
  HomePage({super.location = 'home', super.name = 'home'});

  @override
  Widget builder(BuildContext context) => const HomeScreen();
}

final class WorkoutsPage<T> extends AppPage<T> {
  WorkoutsPage({super.location = 'workouts', super.name = 'workouts'});

  @override
  Widget builder(BuildContext context) => const WorkoutScreen();
}

final class NotFoundPage<T> extends AppPage<T> {
  NotFoundPage({super.location = '404', super.name = '404'});

  @override
  //TODO: remake to not found screen
  Widget builder(BuildContext context) =>
      const Scaffold(body: Center(child: Text('not found 404')));
}
