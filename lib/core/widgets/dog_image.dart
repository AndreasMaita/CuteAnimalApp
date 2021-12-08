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

/**added a comment */