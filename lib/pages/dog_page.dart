import 'package:cute_dog_app/core/models/dog_dto.dart';
import 'package:cute_dog_app/core/services/dog_service.dart';
import 'package:cute_dog_app/core/util/service_locator.dart';
import 'package:cute_dog_app/core/widgets/dog.dart';
import 'package:flutter/material.dart';

class DogPage extends StatefulWidget {
  _DogPageState createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  late Future<DogDto> dog;
  DogService _dogService = getIt<DogService>();

  @override
  void initState() {
    super.initState();
    dog = _dogService.fetchDog();
  }

  void _loadNewDog() {
    setState(() {
      dog = _dogService.fetchDog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _loadNewDog,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FutureBuilder<DogDto>(
                future: dog,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DogWidget(dogUrl: snapshot.data!.url);
                  } else if (snapshot.hasError) {
                    return Text('UPS! Something went wrong :(');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
