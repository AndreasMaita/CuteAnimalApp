import 'package:cute_dog_app/core/cubit/dog_cubit.dart';
import 'package:cute_dog_app/core/widgets/dog_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogWidget extends StatelessWidget {
  const DogWidget({Key? key, required this.dogUrl}) : super(key: key);
  final String dogUrl;

  Widget build(BuildContext context) {
    return Center(child: getApropriateWidget(dogUrl, context));
  }

  Widget getApropriateWidget(String dogUrl, BuildContext context) {
    if (!dogUrl.endsWith(".mp4") && !dogUrl.endsWith(".webm")) {
      return DogImageWidget(dogImageUrl: dogUrl);
    } else {
      BlocProvider.of<DogCubit>(context).loadDogUrl();
      return Container();
    }
  }
}
