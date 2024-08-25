import 'dart:async';

import 'package:flutter/foundation.dart'
    show ChangeNotifier, Listenable, ValueListenable, VoidCallback;
import 'package:meta/meta.dart';

typedef SetState<State extends Object> = void Function(State state);

typedef BLoCSelector<BLoC extends Listenable, Value> = Value Function(BLoC bloc);

typedef BLoCFilter<State> = bool Function(State prev, State next);

typedef EventHandle<Event, State extends Object> = FutureOr<void> Function(
  Event event,
  State setState,
);

abstract class ErrorSync {
  void addError(Object error, [StackTrace? stackTrace]);
}

abstract class BLoCEventSync<Event extends Object?> extends ErrorSync {
  void add(Event event) {}
}

abstract base class BLoC<State extends Object, Event extends Object>
    with ChangeNotifier
    implements BLoCEventSync<Event> {
  BLoC(State initState) : _$state = initState {
    _$isProcessing = false;
  }

  final StreamController<Event> _streamController = StreamController<Event>.broadcast();

  @nonVirtual
  State get state => _$state;
  State _$state;

  @nonVirtual
  bool get isProcessing => _$isProcessing;
  late bool _$isProcessing;

  @override
  void add(Event event) {
    _streamController.add(event);
  }

  @nonVirtual
  @protected
  void setState(State state) {
    _$state = state;
    notifyListeners();
  }

  @nonVirtual
  @protected
  @override
  void notifyListeners() => super.notifyListeners();

  @nonVirtual
  @protected
  @Deprecated('migration to stream transform patter')
  Future<void> handle(
    Future<void> Function(SetState<State> setState) handler,
  ) async {
    if (_$isProcessing) return;
    _$isProcessing = true;
    notifyListeners();
    try {
      await handler(setState);
    } on Object catch (error, stackTrace) {
      // TODO: Rethrow all errors to global observer,
      // and handle them in a single place
    } finally {
      _$isProcessing = false;
      notifyListeners();
    }
  }

  @nonVirtual
  ValueListenable<Value> select<Value>(
    BLoCSelector<BLoC<State, Event>, Value> selector, [
    BLoCFilter<Value>? filter,
  ]) =>
      _BLoCView<BLoC<State, Event>, Value>(this, selector, filter);

  void on<E extends Event>(
    EventHandle<E, SetState<State>> handler, {
    Object? transformer, //TODO: where make to stream transformer!!!
  }) {
    final subscription =
        _streamController.stream.where((event) => event is E).cast<E>().asyncExpand(
      (event) {
        return null;
      },
    ).listen((event) async {
      await handler.call(event, setState);
    });

    subscription.onDone(() {
      subscription.cancel();
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    // TODO: implement addError
  }
}

class _BLoCView<BLoC extends Listenable, Value> extends ChangeNotifier
    implements ValueListenable<Value> {
  _BLoCView(
    BLoC bloc,
    BLoCSelector<BLoC, Value> selector,
    BLoCFilter<Value>? filter,
  )   : _bloc = bloc,
        _filter = filter,
        _selector = selector;

  final BLoC _bloc;
  final BLoCSelector<BLoC, Value> _selector;
  final BLoCFilter<Value>? _filter;

  @override
  get value => hasListeners ? _value : _selector(_bloc);

  late Value _value;

  void _update() {
    final newValue = _selector(_bloc);
    if (identical(newValue, _value)) return;
    if (!(_filter?.call(_value, newValue) ?? true)) return;
    _value = newValue;
    notifyListeners();
  }

  @override
  void addListener(VoidCallback listener) {
    if (!hasListeners) {
      _value = _selector(_bloc);
      _bloc.addListener(_update);
    }
    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!hasListeners) _bloc.removeListener(_update);
  }

  @override
  void dispose() {
    _bloc.removeListener(_update);
    super.dispose();
  }
}
