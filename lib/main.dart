import 'dart:ui';

import 'package:cute_dog_app/cubit/dog_cubit.dart';
import 'package:cute_dog_app/pages/dog_page.dart';
import 'package:cute_dog_app/util/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BannerAd myBanner;
  late AdWidget adWidget;

  @override
  void initState() {
    super.initState();

    var width = (window.physicalSize.shortestSide / window.devicePixelRatio);

    AdSize adSize = AdSize(height: 60, width: width.toInt());

    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: adSize,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
    myBanner.load();
    adWidget = AdWidget(ad: myBanner);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cute Dogs"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: BlocProvider(
              create: (context) => DogCubit(),
              child: DogPage(),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
            child: adWidget,
          )
        ],
      ),
    );
  }
}
