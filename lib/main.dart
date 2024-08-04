import 'package:workouts/runner_stub.dart'
    if (dart.library.io) 'package:workouts/runner_io.dart'
    if (dart.library.html) 'package:workouts/runner_web.dart' as runner;

void main() => runner.run();
