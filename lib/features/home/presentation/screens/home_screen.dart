import 'package:flutter/material.dart';
import 'package:workouts/common/state_menager/base_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = MyBoc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: bloc.select((bloc) {
                  return bloc.state;
                }),
                builder: (context, state, _) {
                  return state.mapOrNull<Widget>(
                        loading: (state) => const SizedBox(
                          height: 40,
                          width: 40,
                          child: RepaintBoundary(child: CircularProgressIndicator()),
                        ),
                        successful: (state) {
                          return Column(
                            children: [for (final item in state.values) Text(item)],
                          );
                        },
                      ) ??
                      const SizedBox.shrink();
                },
              ),
              // ListenableBuilder(
              //   listenable: bloc,
              //   builder: (BuildContext context, Widget? child) {
              //     return Text(bloc.state.toString());
              //   },
              // ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () => bloc.add(const MyEvents.fetch()),
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () => bloc.add(const MyEvents.dec()),
                child: const Text('-'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

sealed class MyEvents {
  const MyEvents._();

  const factory MyEvents.fetch() = FetchEvent;

  const factory MyEvents.dec() = DecrementEvent;

  void map<Event, State>({
    required void Function(FetchEvent) inc,
    required void Function(DecrementEvent) dec,
  });
}

final class FetchEvent extends MyEvents {
  const FetchEvent() : super._();

  @override
  void map<Event, State>({
    required void Function(FetchEvent) inc,
    required void Function(DecrementEvent) dec,
  }) {
    inc.call(this);
  }
}

final class DecrementEvent extends MyEvents {
  const DecrementEvent() : super._();

  @override
  void map<Event, State>({
    required void Function(FetchEvent) inc,
    required void Function(DecrementEvent) dec,
  }) {
    dec.call(this);
  }
}

sealed class MyState {
  const MyState._();

  const factory MyState.loading() = LoadingState;

  const factory MyState.successful({
    required List<String> values,
  }) = SuccessfulState;

  const factory MyState.dec() = ErrorState;

  T? mapOrNull<T>({
    T Function(LoadingState)? loading,
    T Function(ErrorState)? error,
    T Function(SuccessfulState)? successful,
  });
}

final class LoadingState extends MyState {
  const LoadingState() : super._();

  @override
  T? mapOrNull<T>({
    T Function(LoadingState)? loading,
    T Function(ErrorState)? error,
    T Function(SuccessfulState)? successful,
  }) {
    return loading?.call(this);
  }
}

final class SuccessfulState extends MyState {
  const SuccessfulState({required this.values}) : super._();

  final List<String> values;

  @override
  T? mapOrNull<T>({
    T Function(LoadingState)? loading,
    T Function(ErrorState)? error,
    T Function(SuccessfulState)? successful,
  }) {
    return successful?.call(this);
  }
}

final class ErrorState extends MyState {
  const ErrorState() : super._();

  @override
  T? mapOrNull<T>({
    T Function(LoadingState)? loading,
    T Function(ErrorState)? error,
    T Function(SuccessfulState)? successful,
  }) {
    return error?.call(this);
  }
}

final class MyBoc extends BLoC<MyState, MyEvents> {
  MyBoc() : super(const MyState.loading()) {
    on<MyEvents>(
      (event, setState) => event.map<MyEvents, SetState>(
        inc: (event) => _fetchData(event, setState),
        dec: (event) => _testError(event, setState),
      ),
    );
  }

  Future<void> _fetchData(FetchEvent event, SetState<MyState> setState) async {
    await Future.delayed(const Duration(seconds: 2));

    setState(
      const MyState.successful(
        values: [
          'popa',
          'popa',
          'popa',
          'popa',
          'popa',
          'popa',
        ],
      ),
    );
  }

  void _testError(DecrementEvent event, SetState<MyState> setState) {
    throw UnimplementedError();
  }
}
