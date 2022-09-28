import 'package:flutter/material.dart';


import '../screen/home.dart';
import '../screen/library.dart';
import '../screen/search.dart';

// void main() {
//   runApp(Tabbar());
// }

class Tabbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar>{
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent.withOpacity(0.5),
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
        body: Stack(
          children: [
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
}