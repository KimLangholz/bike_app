import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bike_app/events/startup_events.dart';
import 'package:bike_app/states/startup_states.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  StartupBloc();

  @override
  StartupState get initialState => StartupInitialized();

  @override
  Stream<StartupState> mapEventToState(
    StartupEvent event,
  ) async* {
    if (event is AppStarted) {
      yield StartupDone();
    }
  }
}
