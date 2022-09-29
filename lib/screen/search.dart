import 'package:flutter/material.dart';
import './search2.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                            fontSize: 15.0,
                          ),
                        ),
                        alignment: Alignment(-1, -1),
                      )
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 120,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.pink,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                child: Text(
                                  "Podcasts",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                alignment: Alignment(-0.5, -0.5),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/poscard1.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.blue,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                child: Text(
                                  "For You",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                alignment: Alignment(-0.5, -0.5),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/poscard2.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 120,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.brown,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                child: Text(
                                  "Pop",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                alignment: Alignment(-0.5, -0.5),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/album5.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.deepOrange,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                child: Text(
                                  "New Release",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                alignment: Alignment(-0.5, -0.5),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/album6.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 120,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.cyan,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                child: Text(
                                  "Relax",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                alignment: Alignment(-0.5, -0.5),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/album7.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.deepPurple,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                child: Text(
                                  "Sound Wave",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                alignment: Alignment(-0.5, -0.5),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/album8.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
          )
        ],
      )
    );
  }
}