import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/screen/home.dart';
import 'package:untitled/screen/search2.dart';
import 'package:untitled/screen/songview.dart';

Widget Home = const HomeView();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget testWidget = const MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(home: HomeView()),
  );
  testWidgets('Test button ', (tester) async {
    await tester.pumpWidget(testWidget);
    // await tester.tap(find.byType(IconButton).first);
  });

  testWidgets('Inputting a text and wanting to go the display search result', (WidgetTester tester) async {
    Widget testWidget1 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: SearchView2()),
    );
    await tester.pumpWidget(testWidget1);
    final inputText = 'z';
    await tester.enterText(find.byKey(Key('your-text-field')), inputText);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('result')));
    await tester.pumpAndSettle();

    // expect(SongView(), findsWidgets);
    // expect(find.text(inputText), findsWidgets);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home,
    );
  }
}