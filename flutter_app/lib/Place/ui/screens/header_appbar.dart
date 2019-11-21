import 'package:flutter/material.dart';
import 'package:flutter_app/gradient_back.dart';
import 'package:flutter_app/Place/ui/widgets/card_image_list.dart';


class HeaderAppBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(0.4,""),
        CardImageList()
      ],
    );
  }

}