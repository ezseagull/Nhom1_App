import 'package:flutter/material.dart';
import './search2.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String value = "";
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
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30,left: 25),
                          child: Text("Search",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),),
                        ),
                        SizedBox(height: 10,),
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
                                      builder: ((context) => SearchView2()),
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 35.0,
                                  ),
                                ),
                                MaterialButton(
                                  child: Text(
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
                                      builder: ((context) => SearchView2()),
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
                              child: Text(
                                "Browse all",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                ),
                              ),
                              alignment: Alignment(-1, -1),
                            )
                        ),
                        SizedBox(height: 10,),
                        Card_Search(context,"Pod ",Colors.red,"Made ",Colors.green,"assets/images/album19.jfif","assets/images/album20.jfif"),
                        SizedBox(height: 10,),
                        Card_Search(context,"New ",Colors.orange,"Viet",Colors.yellow,"assets/images/album24.jpg","assets/images/album21.jfif"),
                        SizedBox(height: 10,),
                        Card_Search(context,"Pop     ",Colors.purple,"K-pop",Colors.blueAccent,"assets/images/album18.jpg","assets/images/album15.jpg"),
                        SizedBox(height: 10,),
                        Card_Search(context,"Chart",Colors.red[200],"Radio",Colors.green[800],"assets/images/album23.jfif","assets/images/album16.jfif"),
                        SizedBox(height: 10,),
                        Card_Search(context,"Rock",Colors.red,"Indie",Colors.green,"assets/images/album10.jpg","assets/images/album11.jpg"),
                        SizedBox(height: 10,),
                        Card_Search(context,"Latin",Colors.orange,"R&B",Colors.yellow,"assets/images/album7.jpg","assets/images/album8.jpg"),
                        // SizedBox(height: 10,),
                        // Card_Search(context,"Telugu",Colors.purple,"English",Colors.blueAccent,"assets/ser5.jfif","assets/ser6.jfif"),
                      ]
                  )
              )
          )
        ],
      )

    );
  }
  Row Card_Search(BuildContext context, String text, final clrs,
      String text2, final clrs2,
      String image1, String image2) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 85,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10,left: 15,right: 10),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(width: 4),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      transform: new Matrix4.identity()..rotateZ(15 * 3.1415927 / -160),
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
            margin: EdgeInsets.only(top: 10,left: 15,right: 10),
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
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      transform: new Matrix4.identity()..rotateZ(15 * 3.1415927 / -160),
                      child: Image.asset(image2,height: 60,width: 75,fit: BoxFit.cover,),
                    )
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}