import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';


import '../screen/home.dart';
import '../screen/library.dart';
import '../screen/search.dart';
import '../screen/songView.dart';

class Tabbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabbarState();
}
class _TabbarState extends State<Tabbar>{
  int selectedTab = 0;
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            miniSongPlayer(context),
            BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: selectedTab,
              onTap: (index) {
                setState(() {
                  selectedTab = index;
                });
              },
              items:   [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_music_outlined),
                  label: "Your Library",
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            miniSongPlayer(context),
            renderView(0, HomeView()),
            renderView(1, SearchView()),
            renderView(2, LibraryView()),
          ],
        )
      // body: HomeView(),
    );

  }
  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: selectedTab != tabIndex,
      child: Opacity(
        opacity: selectedTab == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
  Widget miniSongPlayer(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
      ),
      duration: const Duration(milliseconds: 500),
      width: deviceSize.width,
      height: 60,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("assets/images/album17.jpg"),
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8),
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text(
                    "Waiting For You",
                    style: TextStyle(
                      fontSize: 15,

                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                      "MONO, Onionn",
                      style: TextStyle(
                        // fontWeight: FontWeight.w200,
                        color: Colors.white54,
                      )
                  ),
                ],
              )),
          SizedBox(width: 120,),
          Icon(Icons.bluetooth_connected, color: Colors.white),
          SizedBox(width: 10,),
          Icon(Icons.play_arrow, color: Colors.white),
        ],
      ),
    );

  }
}