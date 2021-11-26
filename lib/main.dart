import 'dart:async';

import 'package:cute_dog_app/core/services/dog_service.dart';
import 'package:cute_dog_app/core/util/service_locator.dart';
import 'package:cute_dog_app/core/widgets/dog.dart';
import 'package:cute_dog_app/pages/cat_page.dart';
import 'package:cute_dog_app/pages/dog_page.dart';
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
  List<Widget> pages = [
    DogPage(),
    CatPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Datz!"),
        ),
        body: TabBarView(children: pages),
        bottomNavigationBar: Container(
          child: new TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*
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
                    return DogWidget(dogUrl: snapshot.data!.url);
                  } else if (snapshot.hasError) {
                    return Text('UPS! Something went wrong :(');
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
*/