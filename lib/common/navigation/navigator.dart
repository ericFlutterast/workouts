import 'package:flutter/material.dart';
import 'package:workouts/common/navigation/app_navigator.dart';
import 'package:workouts/common/navigation/observers.dart';
import 'package:workouts/common/widgets/shake_widget.dart';
import 'package:workouts/uikit/bottom_navigation.dart';

//TODO: move to other directory and remove file
class AppRoot extends StatefulWidget {
  const AppRoot({
    super.key,
  });

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _currentTabIndex = 0;

  final List<IconData> _bottomNavbarIcons = const [
    Icons.home,
    Icons.fitness_center,
    Icons.query_stats_sharp,
    Icons.person,
  ];

  final List<String> locations = [
    'home',
    'workouts',
    'statistics/bottom/description/dialog',
    'profile'
  ];

  static final _bottomNavKeys = List.generate(4, (_) => UniqueKey());

  final pageObserver = PageObserver();

  @override
  Widget build(BuildContext context) {
    return AppNavigator(
      initPath: 'home',
      pageObserver: pageObserver,
      child: Builder(
        builder: (context) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Navigator(
              pages: AppNavigator.pagesOf(context),
              observers: [pageObserver],
              transitionDelegate: const DefaultTransitionDelegate(),
              onDidRemovePage: (page) {
                print('a');
              },
            ),
            AppBottomNavigation(
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
                        AppNavigator.of(context).buildFromPath(locations[i]);
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
            Positioned(
              right: 10,
              bottom: 100,
              child: ElevatedButton(
                onPressed: () {
                  AppNavigator.maybePop(context);
                },
                child: const Text('pop button'),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 100,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            color: Colors.red,
                            height: 150,
                            width: 250,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('pop')),
                          ),
                        );
                      });
                },
                child: const Text('dialog'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
