import 'package:equatable/equatable.dart';

/// This file contains all the states our App can be in, in regards to the startup procedure.
abstract class StartupState extends Equatable {
  const StartupState();

  @override
  List<Object> get props => [];
}

class StartupInitialized extends StartupState {}

class StartupDone extends StartupState {}
