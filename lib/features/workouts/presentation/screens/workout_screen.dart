import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WorkoutScreen extends HookWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timerValue = useState(60);
    final isDisable = useState(false);
    final timer = useState<Timer?>(null);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(timerValue.value.toString()),
            ElevatedButton(
              onPressed: isDisable.value
                  ? null
                  : () {
                      timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
                        timerValue.value -= 1;
                        if (timerValue.value == 0) {
                          timer.cancel();
                          isDisable.value = false;
                          timerValue.value = 60;
                        }
                      });
                      isDisable.value = true;
                    },
              child: const Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
