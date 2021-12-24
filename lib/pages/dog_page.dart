import 'package:cute_dog_app/core/cubit/dog_cubit.dart';
import 'package:cute_dog_app/core/widgets/dog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogPage extends StatefulWidget {
  _DogPageState createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<DogCubit>(context).loadDogUrl();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        BlocProvider.of<DogCubit>(context).loadDogUrl();
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BlocBuilder<DogCubit, DogState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Icon(Icons.close),
                  );
                } else if (state is LoadedState) {
                  final dog = state.dog;
                  return DogWidget(dogUrl: dog.url);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
