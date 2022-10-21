import 'package:flutter/material.dart';
import 'package:untitled/screen/albumView.dart';

class AlbumCard extends StatelessWidget{
  final Image? image;
  final String? label;
  final String? artist;
  final String? next;
  final Function? onTap;
  final double size;
  const AlbumCard({
    Key? key,
    this.image,
    this.label,
    this.artist,
    this.next,
    this.onTap,
    this.size = 120,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: image,
              lable: label,
              artist: artist,
              next: next,
            ),
          ),
        );
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
                // style: ,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

}