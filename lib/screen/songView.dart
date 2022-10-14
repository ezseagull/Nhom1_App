import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongView extends StatefulWidget {
  final Image? image;
  final String? songurl;
  // SongIn
  SongView({Key? key, this.image, this.songurl}) : super(key: key);

  @override
  State<SongView> createState() => _SongViewState();
}

class _SongViewState extends State<SongView> {
  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  IconData playBtn = Icons.play_arrow;

  PlayerState audioPlayerState = PlayerState.paused;
  // String url = 'https:\/\/cdns-preview-9.dzcdn.net\/stream\/c-9ebf6e13cf6ee229b0dd3e47bf195403-4.mp3';
  int timeProgress = 0;
  int audioDuration = 0;


  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });

    player.setSourceUrl(
        widget.songurl.toString()); // Triggers the onDurationChanged listener and sets the max duration string
    player.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });
    player.onPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    player.seek(newPos);
  }
  @override
  void dispose() {
    player.release();
    player.dispose();
    super.dispose();
  }

  playMusic() async {
    // Add the parameter "isLocal: true" if you want to access a local file
    await player.setSourceUrl(widget.songurl.toString());
  }

  pauseMusic() async {
    await player.pause();
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/album10.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30.0,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          "Pop Mix",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            size: 30.0,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Container(
                      height: 350.0,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topCenter,
                      child:  widget.image,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You Belong With Me",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Taylor Swift",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.favorite_border,
                        //     size: 30.0,
                        //   ),
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                  Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // height: 30.0,
                        width: MediaQuery.of(context).size.width,
                        child: Slider.adaptive(
                          value: timeProgress.toDouble(),
                          max: audioDuration.toDouble(),
                          min: 0.0,
                          onChanged: (value) {
                            seekToSec(value.toInt());
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child:  Text(getTimeString(timeProgress)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child:  Text(getTimeString(audioDuration))
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            child: InkWell(
                              onTapDown: (details) {
                                player.setPlaybackRate(0.5);
                              },
                              onTapUp: (details) {
                                player.setPlaybackRate(1);
                              },
                              child: Center(
                                child: Icon(
                                    Icons.skip_previous,
                                    size: 60.0,
                                  ),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 20.0),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(60.0),
                          //     color: Colors.white,
                          //   ),
                          //   width: 70.0,
                          //   height: 70.0,
                          //   child: InkWell(
                          //     onTap: () {
                          //       setState(() {
                          //         audioPlayerState == PlayerState.playing
                          //             ? pauseMusic()
                          //             : playMusic();
                          //       });
                          //       },
                          //
                          //     child: Center(
                          //       child: Icon(
                          //         Icons.skip_previous,
                          //         size: 60.0,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                  isPlaying? Icons.pause : Icons.play_arrow,
                              ),
                              iconSize: 50,
                                onPressed: () async {
                                if (!isPlaying) {
                                  player.play(UrlSource(widget.songurl.toString()));
                                  setState(() {
                                    playBtn = Icons.pause;
                                    isPlaying = true;
                                  });
                                } else {
                                  player.pause();
                                  setState(() {
                                    playBtn = Icons.play_arrow;
                                    isPlaying = false;
                                  });
                                }
                                },
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            child: InkWell(
                              onTapDown: (details) {
                                player.setPlaybackRate(2);
                              },
                              onTapUp: (details) {
                                player.setPlaybackRate(1);
                              },
                              child: Center(
                                child: Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                  size: 60.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
