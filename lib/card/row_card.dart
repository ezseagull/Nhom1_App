import 'package:flutter/material.dart';
import 'package:untitled/screen/songview.dart';

class RowCard extends StatelessWidget{
  final Image? image;
  final String? label;
  final String? nameArtist;
  final String? songurl;
  final int? index;
  final Function? onTap;
  final double size;
  const RowCard({
    Key? key,
    this.image,
    this.label,
    this.nameArtist,
    this.songurl,
    this.index,
    this.onTap,
    this.size = 50,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: ((context) => SongView(
            image: image,
            lable: label,
            nameArtist: nameArtist,
            songurl: songurl,
            index: index,
          )),
        ));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 5.0),
          child: SizedBox(
            // width: size,
            height: size,
            child: Row(
              children: [
                image ?? Image.asset("assets/images/logo.png"),
                const SizedBox(width: 10,),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label ?? "", maxLines: 3,),
                        Text(
                            textAlign: TextAlign.left,
                            textDirection: TextDirection.ltr,
                            nameArtist ?? "",
                            style: const TextStyle(
                              // fontWeight: FontWeight.w200,
                              color: Colors.white54,
                            )
                        ),
                      ],
                    )
                ),
              ],
            ),
          )
      ),
    );
  }

}