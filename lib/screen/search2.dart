import 'package:flutter/material.dart';
import './search.dart';

class SearchView2 extends StatefulWidget {
  @override
  State<SearchView2> createState() => _SearchView2State();
}

class _SearchView2State extends State<SearchView2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35.0,
                          width: 280.0,
                          decoration: BoxDecoration(
                            color: Color(0xff282828),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextField(
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
                          ),
                        ),
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
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60.0,
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/album18.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              SizedBox(height: 60, width: 30),
                              Column(
                                children: [
                                  Container(
                                    height: 35.0,
                                    width: 100.0,
                                    child: Text(
                                      "Taylor Swift",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    alignment: Alignment(-1, 0.25),
                                  ),
                                  Container(
                                    height: 25.0,
                                    width: 100.0,
                                    child: Text(
                                      "Artist",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 60.0,
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/album13.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              SizedBox(height: 60, width: 30),
                              Column(
                                children: [
                                  Container(
                                    height: 35.0,
                                    width: 100.0,
                                    child: Text(
                                      "Pop mix",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    alignment: Alignment(-1, 0.25),
                                  ),
                                  Container(
                                    height: 25.0,
                                    width: 100.0,
                                    child: Text(
                                      "Album",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 60.0,
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/album8.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              SizedBox(height: 60, width: 30),
                              Column(
                                children: [
                                  Container(
                                    height: 35.0,
                                    width: 100.0,
                                    child: Text(
                                      "Purrple Cat",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    alignment: Alignment(-1, 0.25),
                                  ),
                                  Container(
                                    height: 25.0,
                                    width: 100.0,
                                    child: Text(
                                      "Album",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 60.0,
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/album7.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              SizedBox(height: 60, width: 30),
                              Column(
                                children: [
                                  Container(
                                    height: 35.0,
                                    width: 100.0,
                                    child: Text(
                                      "Laffey",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    alignment: Alignment(-1, 0.25),
                                  ),
                                  Container(
                                    height: 25.0,
                                    width: 100.0,
                                    child: Text(
                                      "Album",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
