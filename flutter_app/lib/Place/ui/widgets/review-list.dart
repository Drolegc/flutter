import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget{

  String nick = "someFulano";
  String comment = "Uy chavon que zarpado!";
  String details = "2 review 4 photos";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Review rev1 = Review(this.nick,this.comment,this.details);
    Review rev2 = Review(this.nick,this.comment,this.details);
    Review rev3 = Review(this.nick,this.comment,this.details);
    Review rev4 = Review(this.nick,this.comment,this.details);

    return Column(
      children: <Widget>[
        rev1,
        rev2,
        rev3,
        rev4
      ],
    );
  }

}