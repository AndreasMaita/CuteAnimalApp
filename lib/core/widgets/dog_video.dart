import 'package:flutter/widgets.dart';

class DogVideoWidget extends StatefulWidget {
  const DogVideoWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _DogVideoWidgetState createState() => _DogVideoWidgetState();
}

class _DogVideoWidgetState extends State<DogVideoWidget> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
      ],),
    );
  }
}