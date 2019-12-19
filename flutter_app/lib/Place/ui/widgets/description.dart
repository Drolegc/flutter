import 'package:flutter/material.dart';
import 'package:flutter_app/button.dart';


class Description extends StatelessWidget{

  String text;
  int number_stars;

  Description(this.text,this.number_stars);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final description = Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03
      ),
      child: Text(
          this.text,
        style: TextStyle(
          fontFamily: "Lato",
          color: Colors.black38
        ),
        textAlign: TextAlign.left,
      ),
    );

    final star = Container(
      margin: EdgeInsets.only(
        top: 320.0,
        right: 3
      ),
      child: Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top:320.0,
            left:20.0,
            right: 20.0,
          ),
          child:Text(
            "Chile",
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              fontFamily: "Lato"
            ),
            textAlign: TextAlign.left,
          )
        ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
            star

          ],
        ),
      ],
    );

    final description_title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_stars,
        description,
        Button(
          onPressed: (){
          Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("Navegando!"),
                duration: Duration(milliseconds: 250),
              )
          );
        },
            texto: "Navigate",)
      ],
    );
    return description_title;
  }


}