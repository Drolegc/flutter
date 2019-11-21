import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget{

  double width = 0.0;
  double height = 0.0;
  final String text; // final por que es requerida
  VoidCallback onPressed;

  ButtonGreen({Key key,@required this.text, @required this.onPressed,this.height,this.width});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonGreen();
  }

}

class _ButtonGreen extends State<ButtonGreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [
                Colors.greenAccent, //Arriba
                Colors.lightGreen //Abajo
              ],
              begin: FractionalOffset(0.3,0.0),
              end: FractionalOffset(1.0,0.6),
              stops: [0.0,0.6],
            ),

        ),
        child: Center(
            child:Text(
              widget.text,
              style: TextStyle(
                  color:Colors.white,
                  fontFamily: "Lato",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w100
              ),
            )
        ),
      ),
    );
  }

}