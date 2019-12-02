import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/gradient_back.dart';

class NewPlace extends StatefulWidget{

  File image;

  NewPlace({
    Key key,
    this.image
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewPlace();
  }

}

class _NewPlace extends State<NewPlace>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            250,
            ""
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0,left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left,color: Colors.black87,size: 45),
                    onPressed: (){
                      //Navegacion
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}