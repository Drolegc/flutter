import 'package:flutter/material.dart';

class ButtonOpt extends StatefulWidget{

  var icon;
  final VoidCallback onPressed;

  ButtonOpt({Key key,@required this.icon, @required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonOpt();
  }

}

class _ButtonOpt extends State<ButtonOpt>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
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
        height: 50.0,
        width: 50.0,
        margin: EdgeInsets.only(
            top: 5.0,
            left: 5.0,
            right: 5.0
        ),
        child:Icon(
          widget.icon,
          color: Colors.white70,
        ),
      ),
    );
  }

}