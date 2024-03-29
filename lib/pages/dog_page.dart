import 'package:cute_dog_app/cubit/dog_cubit.dart';
import 'package:cute_dog_app/widgets/dog.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<DogCubit, DogState>(
          builder: (context, state) {
            if (state is DogLoading) {
              return Center(
                child: Container(),
              );
            } else if (state is DogError) {
              return const Center(
                child: Icon(Icons.close),
              );
            } else if (state is DogLoaded) {
              final dog = state.dog;
              return DogWidget(dogUrl: dog.url);
            } else {
              return Container();
            }
          },
        ),
        ElevatedButton(
          child: Text('Load Dog'),
          onPressed: () {},
        ),
      ],
    );
  }
}
