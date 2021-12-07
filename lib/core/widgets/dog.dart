import 'package:cute_dog_app/core/widgets/dog_image.dart';
import 'package:cute_dog_app/core/widgets/dog_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DogWidget extends StatelessWidget {
  const DogWidget({Key? key, required this.dogUrl}) : super(key: key);
  final String dogUrl;

  Widget build(BuildContext context) {
    return Center(child: getApropriateWidget(dogUrl));
  }

  Widget getApropriateWidget(String dogUrl) {
    if (!dogUrl.endsWith(".mp4")) {
      return DogImageWidget(dogImageUrl: dogUrl);
    } else
      return DogVideoWidget(url: dogUrl);
  }
}
