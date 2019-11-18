import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/widgets/card_image_list.dart';

class GradientBack extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    String title = "Popular";
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber,
            Colors.cyan
          ],
          begin: FractionalOffset(0.2,0.0),
          end: FractionalOffset(1.0,0.6),
          stops: [0.1,0.5],
          //tileMode: TitleMode.clamp
      ),
    ),
        child: Text(
        title,
          style: TextStyle(
            color:Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold
          ),
    ),

      alignment: Alignment(-0.9,-0.6),

    );
  }

}