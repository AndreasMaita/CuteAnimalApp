import 'package:cute_dog_app/core/cubit/dog_cubit.dart';
import 'package:cute_dog_app/core/util/service_locator.dart';
import 'package:cute_dog_app/pages/dog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
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
                              Color.fromRGBO(255, 13, 52, 1),
                              Color.fromRGBO(174, 38, 140, 1),
                              Color.fromRGBO(6, 184, 191, 1),
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
                iconSize: 100,
                icon: Image.asset(
                  'assets/icons/favorite_coming_soon.png',
                ),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 100,
                icon: Image.asset('assets/icons/camera_coming_soon.png'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
