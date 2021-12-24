import 'package:bloc/bloc.dart';
import 'package:cute_dog_app/core/models/models.dart';
import 'package:cute_dog_app/core/services/dog_service.dart';
import 'package:cute_dog_app/core/util/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  DogService _dogService = getIt<DogService>();

  DogCubit() : super(InitialState());

  void loadDogUrl() async {
    try {
      emit(LoadingState());

      this._dogService.fetchDog().then((dog) => emit(LoadedState(dog)));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
