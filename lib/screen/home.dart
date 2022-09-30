import 'package:flutter/material.dart';
import 'package:untitled/json/songs_json.dart';
import '../card/album_card.dart';
import '../card/albumcard1.dart';
import '../theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;
  final String font = "Roboto";
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
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Good afternoon", style: Theme.of(context).textTheme.headline6,),
                        Row(
                          children: [
                            Icon(Icons.notifications_outlined),
                            SizedBox(width: 20),
                            Icon(Icons.history),
                            SizedBox(width: 20),
                            Icon(Icons.settings),
                          ],
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: List.generate(song_type_1.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 20,
                                    child: Text(
                                      song_type_1[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color:  activeMenu1 == index ? black : white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: activeMenu1 == index ? primary : grey,
                                        borderRadius: BorderRadius.circular(30)),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  activeMenu1 = index;
                                });
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            RowAlbumCard(
                                label: "Top 50 - Global",
                                image: AssetImage("assets/images/top50.jpg")),
                            SizedBox(width: 10),
                            RowAlbumCard(
                                label: "Best Mode",
                                image: AssetImage("assets/images/album1.jpg")),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            RowAlbumCard(
                              label: "RapCaviar",
                              image: AssetImage("assets/images/album2.jpg"),
                            ),
                            SizedBox(width: 10),
                            RowAlbumCard(
                              label: "Eminem",
                              image: AssetImage("assets/images/album5.jpg"),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            RowAlbumCard(
                              label: "Top 50 - Vietnam",
                              image: AssetImage("assets/images/album9.jpg"),
                            ),
                            SizedBox(width: 10),
                            RowAlbumCard(
                              label: "Pop Remix",
                              image: AssetImage("assets/images/album10.jpg"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "Your shows",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            AlbumCard(
                              label: "The Good Soldier",
                              image: Image(
                                image: AssetImage("assets/images/poscard1.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            AlbumCard(
                              label: "Buises",
                              image: Image(
                                image: AssetImage("assets/images/poscard2.jpg"),
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "Chill",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            AlbumCard1(
                              label: "Ed Sheeren, Taylor Swift, Charlie Puth, Bruni Mars",
                              image: Image(
                                image: AssetImage("assets/images/album5.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            AlbumCard1(
                              label: "Hoàng Dũng, Vũ, Sơn Tùng M-TP, Đen ",
                              image: Image(
                                image: AssetImage("assets/images/album6.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            AlbumCard1(
                              label: "Purrple Cat, softy, Laffey, Cast",
                              image: Image(
                                image: AssetImage("assets/images/album7.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            AlbumCard1(
                              label: "Purrple Cat, softy, Laffey, Cast",
                              image: Image(
                                image: AssetImage("assets/images/album8.jpg"),
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "Recently played",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            AlbumCard(
                              label: "Pop Mix",
                              image: Image(
                                image: AssetImage("assets/images/album11.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            AlbumCard(
                              label: "Hot Hits Vietnam",
                              image: Image(
                                image: AssetImage("assets/images/album8.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            AlbumCard(
                              label: "Thoải Mái",
                              image: Image(
                                image: AssetImage("assets/images/album13.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            AlbumCard(
                              label: "Purrple Cat",
                              image: Image(
                                image: AssetImage("assets/images/album8.jpg"),
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage("assets/images/album14.jpg"),
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 8),
                            Container(
                                    padding: EdgeInsets.all(5), child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.ltr,
                                        "More like",
                                        style: TextStyle(
                                          fontFamily: font,
                                          // fontWeight: FontWeight.w200,
                                          color: Colors.white54,
                                        )),
                                    Text("Hot Hits Vietnam", style: Theme.of(context).textTheme.headline6)
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          AlbumCard(
                            label: "Indie Viet",
                            image: Image(
                              image: AssetImage("assets/images/album18.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          AlbumCard(
                            label: "Pop Mix",
                            image: Image(
                              image: AssetImage("assets/images/album12.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          AlbumCard(
                            label: "Pop Mix",
                            image: Image(
                              image: AssetImage("assets/images/album13.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text(label)
          ],
        ),
      ),
    );
  }

}