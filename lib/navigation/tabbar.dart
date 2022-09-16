import 'package:flutter/material.dart';


import '../screen/home.dart';
import '../screen/library.dart';
import '../screen/profile.dart';
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
        currentIndex: selectedTab,
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Your Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
        body: Stack(
          children: [
            renderView(0, HomeView()),
            renderView(1, SearchView()),
            renderView(2, LibraryView()),
            renderView(3, ProfileView()),
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