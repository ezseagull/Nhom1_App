import 'package:flutter/material.dart';
import 'package:untitled/screen/songview.dart';

class SongCard extends StatelessWidget{
  final Image? image;
  final String? label;
  final String? nameArtist;
  final String? songurl;
  final Function? onTap;
  final double size;
  const SongCard({
    Key? key,
    this.image,
    this.label,
    this.nameArtist,
    this.songurl,
    this.onTap,
    this.size = 120,
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
          )),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
        child: SizedBox(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image!,
              const SizedBox(height: 10),
              Text(
                label!,
                style: const TextStyle(
                  // fontWeight: FontWeight.w200,
                  color: Colors.white54,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

}