import 'package:flutter/material.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/Place/ui/widgets/card_image.dart';
import 'package:flutter_app/Place/ui/widgets/description.dart';
import 'package:flutter_app/button.dart';

class PlaceInfo extends StatelessWidget{

  Place place;

  int number_stars = 4;
  String pathImage;
  String description;
  String titulo;

  PlaceInfo({
    Key key,
    this.place
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin:EdgeInsets.only(
        top: 5.0,
        bottom: 8.0
      ),
      child:Stack(
        children: <Widget>[
          Container(
            alignment: Alignment(0.1,0.2),
            child:Stack(
              children: <Widget>[
                CardImage(onPressed: null,icon: Icon(Icons.plus_one),height: 250.0,top: 5.0,pathImage: this.place.urlImage,),
                Container(
                  decoration: BoxDecoration(
                      shape:BoxShape.rectangle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color:Colors.black38,
                            blurRadius: 15.0,
                            offset: Offset(0.0,7.0)
                        )
                      ],
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
                  padding: EdgeInsets.only(left: 8.0,right: 8.0,top: 7.5,bottom: 7.5),
                  child: Text(
                    this.place.name,
                    style: TextStyle(
                      color: Colors.white,
                      decorationStyle: TextDecorationStyle.solid,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato"
                    ),
                  ),
                )
              ],
            )
          )
        ],
      )
      /*
      child: Column(
        children: <Widget>[
          CardImage(onPressed: null,icon: Icon(Icons.plus_one),height: 300.0,),
          Text("Some text descriptor")
        ],
      ),*/
    );
  }

}