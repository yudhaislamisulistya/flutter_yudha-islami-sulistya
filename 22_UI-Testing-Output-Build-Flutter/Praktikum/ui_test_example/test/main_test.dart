import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_test_example/main.dart';

void main() {
  testWidgets("Testing 1 Text, 2 Field dan 1 Button", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: MyHomePage()));

    expect(find.byKey(const Key('titleMyHomePage')), findsOneWidget);
    expect(find.byKey(const Key('nameTextField')), findsOneWidget);
    expect(find.byKey(const Key('addressTextField')), findsOneWidget);
    expect(find.byKey(const Key('addButton')), findsNWidgets(1));

    await widgetTester.enterText(find.byKey(const Key('nameTextField')), 'Alta');
    expect(find.text('Alta'), findsOneWidget);
    await widgetTester.enterText(find.byKey(const Key('addressTextField')), 'Jakarta');
    expect(find.text('Jakarta'), findsOneWidget);

    await widgetTester.tap(find.byType(ElevatedButton));
    await widgetTester.pump();
  });
}
