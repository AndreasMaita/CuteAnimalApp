import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DogImageWidget extends StatelessWidget {
  const DogImageWidget({Key? key, required this.dogImageUrl}) : super(key: key);
  final String dogImageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(
            dogImageUrl,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

/**
 * Image.network(imgURL,fit: BoxFit.fill,
  loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
  if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null ? 
             loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
             : null,
      ),
    );
  },
),
 */