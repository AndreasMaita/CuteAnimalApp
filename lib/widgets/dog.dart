import 'package:cute_dog_app/cubit/dog_cubit.dart';
import 'package:cute_dog_app/widgets/dog_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DogWidget extends StatelessWidget {
  DogWidget({Key? key, required this.dogUrl}) : super(key: key);
  final String dogUrl;
  late Map<Permission, PermissionStatus> statuses;

  getPermissions() async {
    statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();
  }

  downloadDog(String dogUrl) async {
    Fluttertoast.showToast(
        msg: "downloading...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 134, 109, 109),
        textColor: Colors.white,
        fontSize: 16.0);
    if (statuses[Permission.storage]!.isGranted) {
      print("Permission granted to read and write.");
      GallerySaver.saveImage(dogUrl).then((value) {
        Fluttertoast.showToast(
            msg: "successfully saved to gallery",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 134, 109, 109),
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getPermissions();
    return Center(child: getApropriateWidget(dogUrl, context));
  }

  Widget getApropriateWidget(String dogUrl, BuildContext context) {
    if (!dogUrl.endsWith(".mp4") && !dogUrl.endsWith(".webm")) {
      return GestureDetector(
        onTap: () {
          BlocProvider.of<DogCubit>(context).loadDogUrl();
        },
        onLongPress: () async {
          await downloadDog(dogUrl);
        },
        child: DogImageWidget(dogImageUrl: dogUrl),
      );
    } else {
      BlocProvider.of<DogCubit>(context).loadDogUrl();
      return Container();
    }
  }
}
