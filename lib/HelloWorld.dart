import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World Demo Application"),
      ),
      body: Center(
          child:
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Hello ", style: TextStyle(fontFamily: "DancingScript", color: Colors.red, fontSize: 20)),
                TextSpan(text: "World", style: TextStyle(fontFamily: "DancingScript", color: Colors.green, fontSize: 20)),
              ]
            )
          )
      ),

    );
  }
}
