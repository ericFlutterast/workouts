import 'package:flutter/material.dart';
import 'package:workouts/features/home/presentation/screens/home_screen.dart';
import 'package:workouts/uikit/bottom_navigation.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    super.key,
  });

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          height: 60,
          color: Colors.pink,
        ),
      ),
      extendBody: true,
      //resizeToAvoidBottomInset: false,
      bottomNavigationBar: AppBottomNavigation(
        onTap: (int) {},
      ),
      // body: Navigator(
      //   key: navigatorState,
      //   // pages: [
      //   //   const MaterialPage(child: HomeScreen()),
      //   //   const MaterialPage(child: WorkoutScreen()),
      //   //   MaterialPage(
      //   //     child: Container(
      //   //       color: Colors.pinkAccent,
      //   //     ),
      //   //   ),
      //   // ],
      //
      //   onGenerateRoute: _onGenerateRoute,
      //   onPopPage: (rout, setting) {
      //     return true;
      //   },
      // ),
    );
  }

  Route<T> _onGenerateRoute<T>(RouteSettings settings) {
    return switch (settings.name) {
      'nome' => MaterialPageRoute<T>(builder: (context) => const HomeScreen()),
      'pink' => MaterialPageRoute<T>(
          builder: (context) => Container(
            color: Colors.pinkAccent,
          ),
        ),
      _ => MaterialPageRoute<T>(builder: (context) => const Text('404'))
    };
  }
}
