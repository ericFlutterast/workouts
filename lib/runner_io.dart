import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:workouts/firebase_options.dart';

import 'app.dart';

void run() => runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print('token: $fcmToken');

      FirebaseMessaging.onMessage.listen((message) {
        if (message.notification != null) {
          print('intercepted message: ${message.notification?.body}');
          print('message data ${message.data}');
        }
      });

      FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
      App.run();
    }, (error, stackTrace) {});

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    print('background message: ${message.notification?.body}');
  }
}
