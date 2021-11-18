import 'dart:async';

import 'package:cute_dog_app/core/services/dog_service.dart';
import 'package:cute_dog_app/core/util/service_locator.dart';
import 'package:flutter/material.dart';
import 'core/models/dog_dto.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cute Dog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<DogDto>(
                future: dog,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(snapshot.data!.url);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadNewDog,
        tooltip: 'show next',
        child: Icon(Icons.add),
      ),
    );
  }
}
