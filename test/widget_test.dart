// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/card/album_card.dart';
import 'package:untitled/card/row_card.dart';
import 'package:untitled/card/song_card.dart';

import 'package:untitled/main.dart';
import 'package:untitled/methods/get_greeting.dart';
import 'package:untitled/models/data.dart';
import 'package:untitled/screen/albumview.dart';
import 'package:untitled/screen/home.dart';
import 'package:untitled/screen/search.dart';
import 'package:untitled/screen/search2.dart';
import 'package:untitled/screen/songview.dart';

void main() {
  Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: MyApp()),
    );
  testWidgets("Test App", (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);
  });

  group("Test AlbumCard", () {
    Widget testWidget1 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: AlbumCard()),
    );

    testWidgets("Test AlbumCard", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget1);
      await tester.pump();
    });
  });

  group("Test RowCard", () {
    Widget testWidget2 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: RowCard()),
    );

    testWidgets("Test RowCard", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget2);
      await tester.pump();
    });
  });

  group("Test SongCard", () {
    Widget testWidget3 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: SongCard()),
    );

    testWidgets("Test SongCard", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget3);
      await tester.pump();
    });
  });

  group("Test AlbumView", () {
    Widget testWidget4 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: AlbumView()),
    );

    testWidgets("Test AlbumView", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget4);
    });
  });

  group("Test SearchView", () {
    Widget testWidget5 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: SearchView()),
    );

    testWidgets("Test SearchView", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget5);
      await tester.pump();
    });
  });

  group("Test SearchView2", () {
    Widget testWidget6 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: SearchView2()),
    );

    testWidgets("Test SearchView2", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget6);
      await tester.pump();
    });
  });

  group("Test SongView", () {
    Widget testWidget7 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: SongView()),
    );

    testWidgets("Test SongView", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget7);
      await tester.pump();
    });
  });

  group("Test HomeView", () {
    Widget testWidget8 = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: HomeView()),
    );

    testWidgets("Test HomeView", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget8);
    });
  });

  test("Data", () {
    final g = greeting();
    final s = Song();
    final d = Data();
    final ar = Artist();
    final al = Album();
    final stj = s.toJson();
    final dtj = d.toJson();
    final artj = ar.toJson();
    final altj = al.toJson();
    final sfj = Song.fromJson(s.toJson());
    final dfj = Data.fromJson(d.toJson());
    final arfj = Artist.fromJson(ar.toJson());
    final alfj = Album.fromJson(al.toJson());
    final songtojson = songToJson(s);
    final songfromjson = songFromJson(songtojson);
  });
}
