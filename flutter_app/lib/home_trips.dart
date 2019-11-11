import 'package:flutter/material.dart';
import 'package:flutter_app/description.dart';
import 'package:flutter_app/review-list.dart';
import 'package:flutter_app/header_appbar.dart';

class HomeTrips extends StatelessWidget{

  String text_description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis ante faucibus, iaculis massa et, feugiat augue. Nulla sagittis nisi id ullamcorper tincidunt. Curabitur sagittis nisi vel orci semper, et molestie neque dapibus. Integer consequat dolor in lectus malesuada, eget placerat justo tristique.";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Description(this.text_description,4),
            ReviewList(),
          ],
        ),
        HeaderAppBar()
      ],
    );
  }

}