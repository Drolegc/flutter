import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/widgets/text_input_location.dart';
import 'package:flutter_app/gradient_back.dart';
import 'package:flutter_app/widgets/text_input.dart';
import 'package:flutter_app/widgets/title_header.dart';

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

    // Controller por cada input
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            0.35,
            ""
          ),
          Row( //APPBAR
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
              ),
              Flexible(
                child:Container(
                    padding: EdgeInsets.only(top: 45.0,left: 20.0,right: 10.0),
                    child: TitleHeader(title: "Add a new place"),
                  ),
                )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0,bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(), // Foto
                Container( // TextField title
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                      hintText: "Title",
                      inputType: null,
                      controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add location",
                    iconData: Icons.location_on,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}