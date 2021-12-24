part of 'dog_cubit.dart';

abstract class DogState extends Equatable {}

class InitialState extends DogState {
  InitialState();

  @override
  List<Object> get props => [];
}

class LoadingState extends DogState {
  @override
  List<Object> get props => [];
}

class LoadedState extends DogState {
  LoadedState(this.dog);

  final DogDto dog;

  @override
  List<Object> get props => [dog];
}

class ErrorState extends DogState {
  @override
  List<Object> get props => [];
}
