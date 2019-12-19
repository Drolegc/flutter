import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget{

  Icon icono;
  VoidCallback onPressed;

  FloatingActionButtonGreen({
    Key key,
    @required this.icono,
    this.onPressed
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen>{

  void SomeVoid(){

    setState(() {
      if(widget.icono.icon.codePoint == Icons.favorite_border.codePoint){
        widget.icono = Icon(Icons.favorite);
      }else if(widget.icono.icon.codePoint != Icons.favorite_border.codePoint){
        widget.icono = Icon(Icons.favorite_border);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Colors.lightGreen,
      onPressed: widget.onPressed,
      mini:true,
      tooltip: "Fav",
      child: widget.icono,
        heroTag: null,
    );
  }

}