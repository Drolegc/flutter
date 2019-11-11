import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/card_image.dart';

class CardImageList extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          CardImage(),
          CardImage(),
          CardImage()
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

}