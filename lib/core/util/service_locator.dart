import 'package:cute_dog_app/core/services/dog_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.asNewInstance();

setupServiceLocator() {
  getIt.registerSingleton<DogService>(DogService());
}
