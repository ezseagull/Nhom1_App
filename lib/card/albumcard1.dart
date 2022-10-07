import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screen/songView.dart';

class AlbumCard1 extends StatelessWidget{
  final Image? image;
  final String? label;
  final Function? onTap;
  final double size;
  const AlbumCard1({
    Key? key,
    this.image,
    this.label,
    this.onTap,
    this.size = 120,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: ((context) => SongView()),
        ));
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
        child: Container(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image!,
              SizedBox(height: 10),
              Text(
                label!,
                style: TextStyle(
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