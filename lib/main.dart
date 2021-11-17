import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

Future<DogResponse> fetchDog() async {
  final response = await http.get(Uri.parse('https://random.dog/woof.json'));

  if (response.statusCode == 200) {
    return DogResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load the dog data');
  }
}

class DogResponse {
  final int fileSizeBytes;
  final String url;

  DogResponse({required this.fileSizeBytes, required this.url});

  factory DogResponse.fromJson(Map<String, dynamic> json) {
    return DogResponse(fileSizeBytes: json['fileSizeBytes'], url: json['url']);
  }
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  late Future<DogResponse> dog;

  @override
  void initState() {
    super.initState();
    dog = fetchDog();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      dog = fetchDog();
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FutureBuilder<DogResponse>(
                future: dog,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(snapshot.data!.url);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}' + "test test test");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
