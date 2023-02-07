import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class DogVideoWidget extends StatefulWidget {
  const DogVideoWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _DogVideoWidgetState createState() => _DogVideoWidgetState();
}

class _DogVideoWidgetState extends State<DogVideoWidget> {
  late VideoPlayerController _controller;
  late Future<void> _intializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _intializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: _intializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return const Center(
              child: Text("loading..."),
            );
          }
        },
      ),
    );
  }
}
