import 'dart:async';

import 'package:l/l.dart';

import 'app.dart';

void run() => runZonedGuarded(() {
      l.e('error');
      l.w('warning');
      l.i('info');
      l.d('debug');
      l.s('should');
      App.run();
    }, (error, stackTrace) {});
