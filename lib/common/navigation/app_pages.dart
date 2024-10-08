import 'package:flutter/material.dart';
import 'package:workouts/features/home/presentation/screens/home_screen.dart';
import 'package:workouts/features/workouts/presentation/screens/workout_screen.dart';

enum RouteTypes {
  page,
  dialog,
  bottomSheet,
}

///Main page for app
abstract class AppPage<T> extends Page<T> {
  AppPage({
    required this.location,
    LocalKey? key,
    String? restorationId,
    this.fullscreenDialog = false,
    this.maintainState = true,
    this.routeTypes = RouteTypes.page,
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
      'statistics' => StatisticsPage(),
      'profile' => ProfilePage(),
      'bottom' => CustomModalBottomSheet(location: 'bottom'),
      'description' => DescriptionPage(),
      'dialog' => CustomDialogPage(),
      _ => NotFoundPage(),
    };
  }

  final String location;
  final bool maintainState;
  final bool fullscreenDialog;
  final RouteTypes routeTypes;
  final RouteSettings? settings;

  @override
  Route<T> createRoute(BuildContext context) => switch (routeTypes) {
        RouteTypes.bottomSheet => createBottomSheetRout(),
        RouteTypes.dialog => createDialogRout(context),
        _ => createPageRout(context, builder(context)),
      };

  Route<T> createDialogRout(BuildContext context) => DialogRoute(
        settings: this,
        context: context,
        builder: builder,
      );

  // }, isScrollControlled: ,
  //   capturedThemes: ,
  //   barrierLabel:,
  //   barrierOnTapHint:,
  //  backgroundColor:,
  // elevation:,
  //   shape:,
  //  clipBehavior:,
  //   constraints:,
  //   modalBarrierColor:,
  //   isDismissible:  true,
  //   enableDrag:  true,
  //   showDragHandle:,
  //   scrollControlDisabledMaxHeightRatio: ,
  //   settings:,
  //   transitionAnimationController:,
  //   anchorPoint:,
  //   useSafeArea:  false,
  //   sheetAnimationStyle:,);

  Route<T> createBottomSheetRout() => ModalBottomSheetRoute<T>(
        builder: builder,
        settings: this,
        isScrollControlled: true,
        useSafeArea: true,
        elevation: 1,
      );

  Route<T> createPageRout(BuildContext context, Widget child) {
    return PageRouteBuilder<T>(
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
  }

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

final class StatisticsPage<T> extends AppPage<T> {
  StatisticsPage({super.location = 'statistics', super.name = 'statistics'});

  @override
  Widget builder(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.pinkAccent,
          child: const Center(
            child: Text('statistics'),
          ),
        ),
      );
}

final class ProfilePage<T> extends AppPage<T> {
  ProfilePage({super.location = 'profile', super.name = 'profile'});

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyanAccent,
        child: const Center(
          child: Text('profile'),
        ),
      ),
    );
  }
}

final class DescriptionPage<T> extends AppPage<T> {
  DescriptionPage({super.location = 'description', super.name = 'description'});

  @override
  Widget builder(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.red,
          child: const Center(
            child: Text('description'),
          ),
        ),
      );
}

final class NotFoundPage<T> extends AppPage<T> {
  NotFoundPage({super.location = '404', super.name = '404'});

  @override
  //TODO: remake to not found screen
  Widget builder(BuildContext context) =>
      const Scaffold(body: Center(child: Text('not found 404')));
}

//TODO: show modal bottom sheet
final class CustomModalBottomSheet<T> extends AppPage<T> {
  CustomModalBottomSheet({required super.location});

  @override
  RouteTypes get routeTypes => RouteTypes.bottomSheet;

  @override
  Widget builder(BuildContext context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hi chupiki'),
            Divider(),
            Text('Look my huiviy navigator'),
          ],
        ),
      );
}

final class CustomDialogPage<T> extends AppPage<T> {
  CustomDialogPage({super.location = 'dialog'});

  @override
  RouteTypes get routeTypes => RouteTypes.dialog;

  @override
  Widget builder(BuildContext context) => Dialog(
        child: Container(
          color: Colors.white,
          height: 200,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hi chupiki'),
              Divider(),
              Text('Look my huiviy navigator'),
            ],
          ),
        ),
      );
}
