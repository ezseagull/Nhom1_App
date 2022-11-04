import 'package:flutter/material.dart';
import '../services/api.dart';
import 'songview.dart';

class SearchView2 extends StatefulWidget {
  const SearchView2({super.key});

  @override
  State<SearchView2> createState() => _SearchView2State();
}

class _SearchView2State extends State<SearchView2> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<int> isSongs = [];
    if (isSongs.isNotEmpty) {
      print(isSongs[0]);
    } else {
      print('the list is empty');
    }
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
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 35.0,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff282828),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: TextField(
                                        key: Key('your-text-field'),
                                        controller: searchController,
                                        autofocus: true,
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                        ),
                                        decoration: const InputDecoration(
                                          icon: Icon(
                                            Icons.search,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          hintText: "Search",
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        // onTap: () {
                                        // },
                                        onChanged: (query) {
                                          List<int> d = [];
                                          if (d.isNotEmpty) {
                                            print(d[0]);
                                          } else {
                                            print('the list is empty');
                                          }

                                          if (query.isNotEmpty) {
                                            for (var i = 0; i < songData.data.length; i++) {
                                              String a = songData.data[i].album.title.toLowerCase();
                                              String b = query.toLowerCase();
                                              if (a.contains(b)) {
                                                d.add(i);
                                              }
                                            }
                                          }
                                          setState(() {
                                            if (isSongs.isNotEmpty) {
                                              print(isSongs[0]);
                                            } else {
                                              print('the list is empty');
                                            }
                                            isSongs = d;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 3,),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          child: const Text(
                                            "Cancel",
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                )
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height - 120,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                // itemCount: songData.data.length,
                                  itemCount: isSongs.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      key: Key('result'),
                                      leading: Image.network(
                                        songData.data[isSongs[index]].album.coverBig,
                                        // songData.data[index].artist.pictureBig,
                                      ),
                                      title: Text(songData.data[isSongs[index]].album.title),
                                      subtitle: Text(songData.data[isSongs[index]].artist.name),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: ((context) => SongView(
                                            lable: songData.data[isSongs[index]].album.title,
                                            image: Image.network(
                                              songData.data[isSongs[index]].artist.pictureXl,
                                            ),
                                            songurl: songData.data[isSongs[index]].preview,
                                            nameArtist: songData.data[isSongs[index]].artist.name,
                                          )),
                                        ));
                                      },
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            }
        )
    );
  }

}

