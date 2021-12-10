import 'package:cute_dog_app/core/widgets/dog_image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Dog Image loads an Image from an url',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        DogImageWidget(dogImageUrl: 'https://picsum.photos/id/237/536/354'));
  });
}
