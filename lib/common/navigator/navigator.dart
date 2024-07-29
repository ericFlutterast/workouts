import 'package:flutter/material.dart';
import 'package:workouts/features/home/presentation/screens/home_screen.dart';
import 'package:workouts/features/workouts/presentation/screens/workout_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    super.key,
  });

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: navigatorState,
        pages: [
          const MaterialPage(child: HomeScreen()),
          const MaterialPage(child: WorkoutScreen()),
          MaterialPage(
            child: Container(
              color: Colors.pinkAccent,
            ),
          ),
        ],
        //onGenerateRoute: (settings),
        onPopPage: (rout, setting) {
          return false;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigatorState.currentState?.pop(),
      ),
    );
  }
}
