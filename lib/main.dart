import 'package:cute_dog_app/core/cubit/dog_cubit.dart';
import 'package:cute_dog_app/core/util/service_locator.dart';
import 'package:cute_dog_app/pages/dog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    DogPage(),
  ];

  List<Tab> tabs = <Tab>[
    Tab(
      child: Text(
        "Dog",
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 41.0,
              fontFamily: "Greatvibes"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('Datz!'),
          leadingWidth: 150,
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color.fromRGBO(174, 38, 140, 0.8),
                              Color.fromRGBO(121, 198, 201, 0.8),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('Beta!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) => DogCubit(),
              child: DogPage(),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
