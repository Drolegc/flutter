import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/floating_action_button_green.dart';

class CardImage extends StatelessWidget{

    double height;
    double width;
    double left;
    final Icon icon;
    VoidCallback onPressed;
    String pathImage;
    File imagen;

    CardImage({
      Key key,
      this.height = 350.0,
      this.width = 250.0,
      this.left = 20.0,
      this.imagen,
      this.pathImage = "assets/img/Example.jpeg",
      @required this.icon,
      @required this.onPressed
    });


  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: this.height,
      width: this.width,
        margin: EdgeInsets.only(
          top: 80.0,
          left: this.left,
        ),
      decoration: BoxDecoration(
        image:DecorationImage(
          fit: BoxFit.cover,
          image:(this.imagen != null)?FileImage(imagen): AssetImage(
            this.pathImage
          ),
        ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape:BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color:Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0,7.0)
          )
        ]
      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(icono:this.icon,onPressed: this.onPressed,),
      ],
    );
  }

}