import 'package:flutter/material.dart';
import 'package:untitled/screen/songView.dart';
import '../card/album_card.dart';
import '../card/row_card.dart';
import '../services/api.dart';

class AlbumView extends StatefulWidget {
  final Image? image;
  final String? lable;
  final String? artist;
  final String? next;
  const AlbumView({
    Key? key,
    this.lable,
    this.image,
    this.artist,
    this.next,
  }) : super(key: key);
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: widget.image,
                ),

                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:  const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.lable!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green, borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          child: Text(
                            "Subscribe",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                    // controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    child:
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(1),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Đông tới Tây, đây là ca khúc thịnh hành nhất trong thời gian gần đây. Ảnh bìa: hgh",
                                        style: Theme.of(context).textTheme.caption,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: const [
                                          Image(
                                            image: AssetImage('assets/images/logo.png'),
                                            width: 32,
                                            height: 32,
                                          ),
                                          SizedBox(width: 8),
                                          Text("Spotify")
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "1,888,132 likes 5h 3m",
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                      const SizedBox(height: 16),
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.favorite, color: Colors.green,),
                                              SizedBox(width: 16),
                                              Icon(Icons.more_horiz),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: FutureBuilder(
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
                                                  return  Column(
                                                    children: [
                                                      for (var i = 1; i < songData.data.length - 13; i++)
                                                        RowCard(
                                                          label: songData.data[i].album.title,
                                                          image: Image.network(
                                                            songData.data[i].artist.pictureXl,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          songurl: songData.data[i].preview,
                                                          nameArtist: songData.data[i].artist.name,
                                                        ),
                                                    ],
                                                  );
                                                }
                                              }
                                          )
                                      )

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You might also like",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AlbumCard(
                                      size: cardSize,
                                      label: "More DJ",
                                      image: const Image(
                                        image: AssetImage("assets/images/album13.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    AlbumCard(
                                      size: cardSize,
                                      label: "Pop",
                                      image: const Image(
                                        image: AssetImage("assets/images/album12.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AlbumCard(
                                      size: cardSize,
                                      label: "Hip hop",
                                      image: const Image(
                                        image: AssetImage("assets/images/album3.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    AlbumCard(
                                      size: cardSize,
                                      label: "R&B",
                                      image: const Image(
                                        image: AssetImage("assets/images/album9.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            )
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget songAlbum(BuildContext context, Image? image, String? label, String? nameArtist, String? songurl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: ((context) => SongView(
            image: image,
            lable: label,
            nameArtist: nameArtist,
            songurl: songurl,
          )),
        ));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 5.0),
          child: Row(
            children: [
              const Image(
                image: AssetImage("assets/images/album17.jpg"),
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10,),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Waiting For You", ),
                      Text(
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          "MONO, Onionn",
                          style: TextStyle(
                            // fontWeight: FontWeight.w200,
                            color: Colors.white54,
                          )
                      ),
                    ],
                  )
              ),
              const SizedBox(width: 160,height: 20,),
              const Icon(Icons.more_horiz),
            ],
          )
      ),
    );
  }
}


