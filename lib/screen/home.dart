import 'package:flutter/material.dart';
import 'package:untitled/card/song_card.dart';
import 'package:untitled/services/api.dart';
import '../card/album_card.dart';
import '../methods/get_greeting.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;
  final String font = "Roboto";
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: API().getSongFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            final dynamic songData = snapshot.data;
            return Stack(
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
                  physics: const BouncingScrollPhysics(),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(greeting(), style: Theme.of(context).textTheme.headline6,),
                              Row(
                                children: const [
                                  Icon(Icons.notifications_outlined),
                                  SizedBox(width: 20),
                                  Icon(Icons.history),
                                  SizedBox(width: 20),
                                  Icon(Icons.settings),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: SafeArea(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.black26,
                                        ),
                                        child: const Text("Music",style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400
                                        ),),
                                      ),
                                      const SizedBox(width: 10,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.black26,
                                        ),
                                        child: const Text("Podcasts & Shows",style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400
                                        ),),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: const [
                                  RowAlbumCard(
                                      label: "Top 50 - Global  ",
                                      image: AssetImage("assets/images/top50.jpg")),
                                  SizedBox(width: 10),
                                  RowAlbumCard(
                                      label: "Best Mode     ",
                                      image: AssetImage("assets/images/album1.jpg")),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: const [
                                  RowAlbumCard(
                                    label:    "Top 50 - Pop      ",
                                    image: AssetImage("assets/images/album2.jpg"),
                                  ),
                                  SizedBox(width: 10),
                                  RowAlbumCard(
                                    label: "It's a hit           ",
                                    image: AssetImage("assets/images/album5.jpg"),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: const [
                                  RowAlbumCard(
                                    label: "V - pops              ",
                                    image: AssetImage("assets/images/album9.jpg"),
                                  ),
                                  SizedBox(width: 10),
                                  RowAlbumCard(
                                    label: "Pop Remix      ",
                                    image: AssetImage("assets/images/album10.jpg"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                "Your shows",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  for (var i = 3; i < songData.data.length-20; i++)
                                    AlbumCard(
                                      label: songData.data[i].album.title,
                                      image: Image.network(
                                        songData.data[i].album.coverBig,
                                        fit: BoxFit.cover,
                                      ),
                                      // tracklist: songData.data[i].album.tracklist,
                                      artist:  songData.data[i].artist.name,
                                      next: songData.next,
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                "Chill",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  for (var i = 18; i < songData.data.length; i++)
                                    SongCard(
                                      label: songData.data[i].album.title,
                                      image: Image.network(
                                        songData.data[i].artist.pictureXl,
                                      ),
                                      songurl: songData.data[i].preview,
                                      nameArtist: songData.data[i].artist.name,
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                "Recently played",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  for (var i = 20; i < songData.data.length; i++)
                                    AlbumCard(
                                      label: songData.data[i].artist.name,
                                      image: Image.network(
                                        songData.data[i].artist.pictureBig,

                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Image(
                                    image: AssetImage("assets/images/album17.jpg"),
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                              "More like",
                                              style: TextStyle(
                                                fontFamily: font,
                                                // fontWeight: FontWeight.w200,
                                                color: Colors.white54,
                                              )),
                                          Text("Hot Hits Vietnam", style: Theme.of(context).textTheme.headline6)
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  for (var i = 1; i < songData.data.length-20; i++)
                                    SongCard(
                                      label: songData.data[i].album.title,
                                      image: Image.network(
                                        songData.data[i].artist.pictureBig,
                                      ),
                                      songurl: songData.data[i].preview,
                                      nameArtist: songData.data[i].artist.name,
                                    ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      )
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final String value = "";
  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          // onTap: () {
          //   Navigator.push(context, MaterialPageRoute(
          //     builder: ((context) => AlbumView(image: image!)),
          //   ));
          // },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                Image(
                  image: image,
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8,),
                Text(label),
              ],
            ),
          ),
        )
    );
  }
}

//miniplayer
// class PlayerHome extends StatefulWidget {
//   @override
//   _PlayerHomeState createState() => _PlayerHomeState();
// }

// class _PlayerHomeState extends State<PlayerHome> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // onTap: () {
//       //   Navigator.push(
//       //       context,
//       //       PageRouteBuilder(
//       //           pageBuilder: (context, _, __) => SongView(widget.song)));
//       // },
//       child: Container(
//         height: 130,
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Hero(tag: "image", child: child)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }