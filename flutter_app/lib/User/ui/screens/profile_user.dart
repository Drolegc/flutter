import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/ui/widgets/buttons_bar.dart';
import 'package:flutter_app/User/ui/widgets/profile_info_banner.dart';

class ProfileUser extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.greenAccent,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ProfileInfoBanner(),
          ButtonsBar(),
        ],
      ),
    );
  }


}
