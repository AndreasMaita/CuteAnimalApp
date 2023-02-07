import 'dart:convert';

import 'package:cute_dog_app/constants/api_path.dart' as Constants;
import 'package:cute_dog_app/models/dog_dto.dart';
import 'package:http/http.dart' as http;

class DogService {
  Future<DogDto> fetchDog() async {
    final response = await http.get(Uri.parse(Constants.DOG_API_URL));

    if (response.statusCode == 200) {
      return DogDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load the dog data');
    }
  }
}
