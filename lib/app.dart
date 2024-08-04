import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:workouts/common/navigator/navigator.dart';

class App extends StatefulWidget {
  const App({super.key});

  static run() => runApp(const App());

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['type'] == 'chat') {
        print('dfafafafds');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialContext();
  }
}

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workouts',
      home: AppNavigator(),
    );
  }
}
