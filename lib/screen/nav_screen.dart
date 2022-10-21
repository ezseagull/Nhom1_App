// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:miniplayer/miniplayer.dart';
// import 'package:untitled/models/data.dart';
// import 'package:untitled/screen/songview.dart';
// import 'package:untitled/screen/utils.dart';
//
//
// final ValueNotifier<double> playerExpandProgress =
// ValueNotifier(playerMinHeight);
//
// final MiniplayerController controller = MiniplayerController();
//
// class NavScreen extends StatefulWidget {
//   @override
//   _NavScreenState createState() => _NavScreenState();
// }
// class _NavScreenState extends State<NavScreen> {
//   final Song? songData;
//
//   _NavScreenState(this.songData);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Miniplayer(
//       valueNotifier: playerExpandProgress,
//       maxHeight: playerMaxHeight,
//       minHeight: playerMinHeight,
//       controller: controller,
//       elevation: 4,
//       onDismissed: ,
//     )
//   }
//
// }