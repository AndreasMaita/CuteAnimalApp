import 'package:cute_dog_app/core/models/dog_dto.dart';
import 'package:cute_dog_app/core/services/dog_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDogService extends Mock implements DogService {}

void main() => {
      test('Sucessful Http Call', () async {
        final service = DogService();
        expect(await service.fetchDog(), isA<DogDto>());
      })
    };
