import 'package:bike_app/app/views/log_in/login_view.dart';
import 'package:bike_app/app/views/splash_view/splash_view.dart';
import 'package:bike_app/blocs/startup_bloc.dart';
import 'package:bike_app/events/startup_events.dart';
import 'package:bike_app/states/startup_states.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bike_app/repositories/user_repository.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

///
/// This class is what starts our application.
///
void main() {
  // The BlocSupervisor is responsible for handling all the BlocDelegate in our app.
  BlocSupervisor.delegate = SimpleBlocDelegate();
  // Instantiates a new user repository object.
  final userRepository = UserRepository();

  // the runApp method is required and is the starting point of our app.
  /*
    
    // We start by wanting to authenticate the user when they open the app.
    // We call the AuthenticationBloc, pass in the userRepository and the event (AppStarted) which corresponds
    // to a method inside the AuthenticationBloc.
    // If the user is authenticated at this stage, they skip the login screen. The method then calls the App() class
    // which takes in the userRepository as argument.
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );*/
  runApp(
    
    // We start by wanting to authenticate the user when they open the app.
    // We call the AuthenticationBloc, pass in the userRepository and the event (AppStarted) which corresponds
    // to a method inside the AuthenticationBloc.
    // If the user is authenticated at this stage, they skip the login screen. The method then calls the App() class
    // which takes in the userRepository as argument.
    BlocProvider<StartupBloc>(
      create: (context) {
        return StartupBloc()..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

/// The App class is a statelessWidget, meaning it doesn't have to update its view at any point. 
class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<StartupBloc, StartupState>(
        builder: (context, state) {
          if (state is StartupInitialized) {
            return SplashPage();
          }
          if (state is StartupDone) {
            return LoginPage(userRepository: userRepository);
          }
        },
      ),
    );
  }
}
