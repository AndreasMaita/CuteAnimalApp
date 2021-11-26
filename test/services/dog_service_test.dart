

import 'package:cute_dog_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => {
  testWidgets('HTTP call test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  })
};
