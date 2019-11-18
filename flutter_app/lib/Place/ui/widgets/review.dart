import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget{

  String nick = "someFulano";
  String comment = "Uy chavon que zarpado!";
  String details = "2 review 4 photos";

  Review(this.nick, this.comment, this.details);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final userComment = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        comment,
        style: TextStyle(
            fontSize: 15
        ),
      ),
    );

    final userDetails = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        details,
        style: TextStyle(
            fontSize: 10,
          color:Colors.black26
        ),
      ),
    );

    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),
      child: Text(
        nick,
        style: TextStyle(
          fontSize: 18
        ),
      ),
    );

    final user = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userDetails,
        userComment

      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0
      ),
      width: 80.0,
      height: 80.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit:BoxFit.cover,
              image: AssetImage("assets/img/platziConf.png")
            )
        ),
    );
    
    return Row(
      children: <Widget>[
        photo,
        user
      ],
    );
  }
  
  
}