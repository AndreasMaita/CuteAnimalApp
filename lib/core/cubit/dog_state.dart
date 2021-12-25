part of 'dog_cubit.dart';

abstract class DogState extends Equatable {}

class DogInitial extends DogState {
  @override
  List<Object> get props => [];
}

class DogLoading extends DogState {
  @override
  List<Object> get props => [];
}

class DogLoaded extends DogState {
  DogLoaded(this.dog);

  final DogDto dog;

  @override
  List<Object> get props => [dog];
}

class DogError extends DogState {
  @override
  List<Object> get props => [];
}
