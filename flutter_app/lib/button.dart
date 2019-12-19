import 'package:flutter/material.dart';

class Button extends StatelessWidget{

  final String texto;
  final VoidCallback onPressed;

  Button({
    Key key,
    @required this.texto,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: this.onPressed,
      child:Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
        ),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.lightGreen
            ],
            begin: FractionalOffset(0.3,0.0),
            end: FractionalOffset(1.0,0.6),
            stops: [0.0,0.6],

          )
        ),
        child: Center(
          child:Text(
              this.texto,
            style: TextStyle(
              color:Colors.white,
              fontFamily: "Lato",
              fontSize: 12.0,
              fontWeight: FontWeight.w100
            ),
          )
        ),
      )
    );
  }

}