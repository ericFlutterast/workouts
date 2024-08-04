import 'package:flutter/material.dart';
import 'package:workouts/uikit/bottom_navigation.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    super.key,
  });

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  final GlobalKey<NavigatorState> _navigatorState = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  final List<IconData> _bottomNavbarIcons = const [
    Icons.home,
    Icons.fitness_center,
    Icons.query_stats_sharp,
    Icons.person,
  ];

  static final _bottomNavKeys = List.generate(4, (_) => UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Navigator(
        key: _navigatorState,
        initialRoute: 'home',
        onPopPage: (rout, settings) {
          if (rout.settings.name == 'person') return false;

          return true;
        },
        onGenerateRoute: _onGenerateRoute,
      ),
      extendBody: true,
      bottomNavigationBar: AppBottomNavigation(
        children: [
          for (int i = 0; i < 4; i++)
            ShakeWidget(
              deltaY: 6.5,
              curve: Curves.bounceOut,
              key: _bottomNavKeys[i],
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _currentTabIndex = i;
                    _bottomNavKeys[i] = UniqueKey();
                  });
                  _changePage(i);
                },
                icon: Icon(
                  _bottomNavbarIcons[i],
                  color: i == _currentTabIndex ? Colors.white : Colors.white70,
                  size: 30,
                ),
              ),
            )
        ],
      ),
    );
  }

  void _changePage(int index) {
    switch (index) {
      case 0:
        _navigatorState.currentState?.pushReplacementNamed('home');
      case 1:
        _navigatorState.currentState?.pushReplacementNamed('workouts');
      case 2:
        _navigatorState.currentState?.pushReplacementNamed('statistics');
      case 3:
        _navigatorState.currentState?.pushReplacementNamed('profile');
    }
  }

  Route<T> _onGenerateRoute<T>(RouteSettings settings) {
    return switch (settings.name) {
      'home' => _createRoute(
          child: Container(
            color: Colors.pink,
            child: const Center(
              child: Icon(Icons.home),
            ),
          ),
        ),
      'workouts' => _createRoute(
          child: Container(
            color: Colors.yellow,
            child: const Center(
              child: Icon(Icons.fitness_center),
            ),
          ),
        ),
      'statistics' => _createRoute(
          child: Container(
            color: Colors.green,
            child: const Center(
              child: Icon(Icons.query_stats_sharp),
            ),
          ),
        ),
      'profile' => _createRoute(
          child: Container(
            color: Colors.orange,
            child: const Center(
              child: Icon(Icons.person),
            ),
          ),
        ),
      _ => MaterialPageRoute<T>(builder: (context) => const Text('404'))
    };
  }

  Route<T> _createRoute<T>({required Widget child}) => PageRouteBuilder(
        //transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondAnimation) => FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeIn,
            ),
          ),
          child: child,
        ),
      );
}

@immutable
final class ShakeWidget extends StatelessWidget {
  const ShakeWidget({
    super.key,
    this.child,
    this.curve = Curves.easeInSine,
    this.duration = const Duration(milliseconds: 400),
    this.deltaY = 5.0,
  });

  final Widget? child;
  final Curve curve;
  final Duration duration;
  final double deltaY;

  double _shake(double animation) {
    return 2 * (0.5 - (0.5 - curve.transform(animation)).abs());
  }

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
        key: key,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: duration,
        builder: (context, animation, child) => Transform.translate(
          offset: Offset(
            deltaY * _shake(animation),
            -deltaY * _shake(animation),
          ),
          child: child!,
        ),
        child: child,
      );
}
