import 'package:cute_dog_app/core/cubit/dog_cubit.dart';
import 'package:cute_dog_app/core/util/service_locator.dart';
import 'package:cute_dog_app/pages/cat_page.dart';
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

  List<Tab> tabs = <Tab>[
    Tab(
      text: "Dog",
    ),
    Tab(
      text: "Cat",
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabs,
          ),
          title: Text('Datz!'),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) => DogCubit(),
              child: DogPage(),
            ),
            BlocProvider(
              create: (context) => DogCubit(),
              child: CatPage(),
            ),
          ],
        ),
      ),
    );
  }
}
