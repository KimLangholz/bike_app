import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:bike_app/blocs/authentication_bloc.dart';
import 'package:bike_app/events/authentication_events.dart';
import 'package:bike_app/events/login_events.dart';
import 'package:bike_app/repositories/user_repository.dart';
import 'package:bike_app/states/login_states.dart';

/*class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /*final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        //yield AuthenticationAuthenticated();
      } else {
        //yield AuthenticationUnauthenticated();
      }
    }
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }*/
}*/
