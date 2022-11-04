import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:untitled/screen/albumview.dart';
import 'package:untitled/screen/home.dart';
import 'package:untitled/screen/search2.dart';
import 'package:untitled/screen/songview.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Inputting a text and wanting to go the display search result', (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: SearchView2()),
    );
    await tester.pumpWidget(testWidget);
    final inputText = 'z';
    await tester.enterText(find.byKey(Key('your-text-field')), inputText);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('result')));
    await tester.pumpAndSettle();

    // expect(SongView(), findsWidgets);
    expect(find.text(inputText), findsWidgets);
  });
  group('Album screen', () {
    Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: AlbumView()),
    );

    testWidgets('Test play button', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byType(IconButton).first);
    });
    // testWidgets('Test learn a new course button', (tester) async {
    //   await tester.pumpWidget(testWidget);
    //   await tester.tap(find.byType(ElevatedButton).first);
    // });

    // testWidgets('Test courses', (tester) async {
    //   await tester.pumpWidget(testWidget);
    //   await tester.tap(find.byType(InkWell).first);
    // });
  });
}