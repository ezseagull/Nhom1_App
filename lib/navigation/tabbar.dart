import 'package:flutter/material.dart';
import '../screen/home.dart';
import '../screen/library.dart';
import '../screen/search.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

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
              items: const [
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
            renderView(0, const HomeView()),
            renderView(1, const SearchView()),
            renderView(2, const LibraryView()),
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
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
      ),
      duration: const Duration(milliseconds: 500),
      width: deviceSize.width,
      height: 60,

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("assets/images/album17.jpg"),
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
              const SizedBox(width: 120,),
              const Icon(Icons.bluetooth_connected, color: Colors.white),
              const SizedBox(width: 10,),
              const Icon(Icons.play_arrow, color: Colors.white),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text(
          //       Duration(seconds: currentSlider.toInt())
          //           .toString()
          //           .split('.')[0]
          //           .substring(2),
          //       style: TextStyle(color: Colors.white),
          //     ),
          //     Container(
          //       width: MediaQuery.of(context).size.width - 120,
          //       child: SliderTheme(
          //         data: SliderTheme.of(context).copyWith(
          //           thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
          //           trackShape: RectangularSliderTrackShape(),
          //           trackHeight: 4,
          //         ),
          //         child: Slider(
          //           value: currentSlider,
          //           max: widget.song.duration.toDouble(),
          //           min: 0,
          //           inactiveColor: Colors.grey[500],
          //           activeColor: Colors.white,
          //           onChanged: (val) {
          //             setState(() {
          //               currentSlider = val;
          //             });
          //           },
          //         ),
          //       ),
          //     ),
          //     Text(
          //       Duration(seconds: widget.song.duration)
          //           .toString()
          //           .split('.')[0]
          //           .substring(2),
          //       style: TextStyle(color: Colors.white),
          //     )
          //   ],
          // )
        ],
      )
    );

  }
}