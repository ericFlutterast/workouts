import 'package:flutter/material.dart';
import 'package:workouts/common/navigation/app_navigator.dart';
import 'package:workouts/common/widgets/shake_widget.dart';
import 'package:workouts/uikit/bottom_navigation.dart';

//TODO: move to other directory
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

  final List<String> locations = ['home', 'workouts', '', ''];

  static final _bottomNavKeys = List.generate(4, (_) => UniqueKey());

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Navigator(
            pages: AppNavigator.of(context).pages,
            transitionDelegate: const DefaultTransitionDelegate(),
            onDidRemovePage: (page) {
              //TODO:
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
                      AppNavigator.of(context).addPageNamed(locations[i]);
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
        ],
      );
}
