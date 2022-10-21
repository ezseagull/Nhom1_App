import 'package:flutter/material.dart';
import 'package:untitled/services/api.dart';
import './search2.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
                                const Padding(
                                  padding: EdgeInsets.only(top: 30,left: 25),
                                  child: Text("Search",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25
                                    ),),
                                ),
                                const SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                                  child: Container(
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(
                                              builder: ((context) => const SearchView2()),
                                            ));
                                          },
                                          icon: const Icon(
                                            Icons.search,
                                            color: Colors.black,
                                            size: 35.0,
                                          ),
                                        ),
                                        MaterialButton(
                                          child: const Text(
                                            "What do you want to listen to?",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          onPressed: () {
                                            TextField(
                                              onChanged: (text) {
                                                value = text;
                                              },
                                            );
                                            Navigator.push(context, MaterialPageRoute(
                                              builder: ((context) => const SearchView2()),
                                            ));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                    child: Container(
                                      alignment: const Alignment(-1, -1),
                                      child: const Text(
                                        "Browse all",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                ),
                                const SizedBox(height: 10,),
                                Card_Search(context,"Pod ",Colors.red,"Made ",Colors.green,"assets/images/album19.jfif","assets/images/album20.jfif"),
                                const SizedBox(height: 10,),
                                Card_Search(context,"New ",Colors.orange,"Viet",Colors.yellow,"assets/images/album24.jpg","assets/images/album21.jfif"),
                                const SizedBox(height: 10,),
                                Card_Search(context,"Pop     ",Colors.purple,"K-pop",Colors.blueAccent,"assets/images/album18.jpg","assets/images/album15.jpg"),
                                const SizedBox(height: 10,),
                                Card_Search(context,"Chart",Colors.red[200],"Radio",Colors.green[800],"assets/images/album23.jfif","assets/images/album16.jfif"),
                                const SizedBox(height: 10,),
                                Card_Search(context,"Rock",Colors.red,"Indie",Colors.green,"assets/images/album10.jpg","assets/images/album11.jpg"),
                                const SizedBox(height: 10,),
                                Card_Search(context,"Latin",Colors.orange,"R&B",Colors.yellow,"assets/images/album7.jpg","assets/images/album8.jpg"),
                                // SizedBox(height: 10,),
                                // Card_Search(context,"Telugu",Colors.purple,"English",Colors.blueAccent,"assets/ser5.jfif","assets/ser6.jfif"),
                              ]
                          )
                      )
                  )
                ],
              );
            }
          }
      )
    );
  }
  Widget Card_Search(BuildContext context, String text, final clrs,
      String text2, final clrs2,
      String image1, String image2) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(
      //     builder: ((context) => SongView(
      //       image: image,
      //       lable: label,
      //       nameArtist: nameArtist,
      //       songurl: songurl,
      //     )),
      //   ));
      // },
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 85,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10,left: 15,right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: clrs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 10, left: 8),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / -160),
                        child: Image.asset(image1,height: 60,width: 75,fit: BoxFit.cover,),
                      )
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 85,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10,left: 15,right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: clrs2,
              ),
              clipBehavior: Clip.antiAlias,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: Text(
                      text2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / -160),
                        child: Image.asset(image2,height: 60,width: 75,fit: BoxFit.cover,),
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}