import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => InitialCounterState();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    // TODO: Add your event logic
  }
}
