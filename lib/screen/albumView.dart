import 'package:flutter/material.dart';

class AlbumView extends StatefulWidget{
  @override
  _AlbumView createState() => _AlbumView();
}

class _AlbumView extends State<AlbumView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .46,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0),
                    ])
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              
            ),
          )
        ],

      ),
    );
  }
}