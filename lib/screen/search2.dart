import 'package:flutter/material.dart';
import 'package:untitled/models/songs.dart';
import '../services/api.dart';
import './search.dart';

class SearchView2 extends StatefulWidget {
  @override
  State<SearchView2> createState() => _SearchView2State();
}

class _SearchView2State extends State<SearchView2> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: API().getSongFromApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
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
                    physics: BouncingScrollPhysics(),
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
                                      color: Color(0xff282828),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextField(
                                      controller: searchController,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                      decoration: InputDecoration(
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
                                      onTap: () {
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 3,),
                                  Row(
                                    children: [
                                      MaterialButton(
                                        child: Text(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Container(
                              child: Text(
                                "Recent searches",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              alignment: Alignment(-1, -1),
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

