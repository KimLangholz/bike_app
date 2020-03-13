import 'package:equatable/equatable.dart';

/// This class contains all the startup events we have in our App.
/// 
abstract class StartupEvent extends Equatable {
  const StartupEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends StartupEvent {}