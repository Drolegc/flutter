import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen>{

  var icono = Icon(Icons.favorite_border);

  void SomeVoid(){

    setState(() {
      if(this.icono.icon.codePoint == Icons.favorite_border.codePoint){
        this.icono = Icon(Icons.favorite);
      }else if(this.icono.icon.codePoint != Icons.favorite_border.codePoint){
        this.icono = Icon(Icons.favorite_border);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Colors.lightGreen,
      onPressed: this.SomeVoid,
      mini:true,
      tooltip: "Fav",
      child: this.icono
    );
  }

}