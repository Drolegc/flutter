import 'package:flutter/material.dart';
import 'package:flutter_app/User/model/user.dart';

class UserInfo extends StatelessWidget{

  final User user;

  UserInfo({Key key,@required this.user});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 150.0,
      color: Colors.white70,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: 20.0,
            ),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              image:DecorationImage(
                image: NetworkImage(user.imgProfile),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20.0,
            ),
            child: Center(
              child: Text(
                this.user.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontFamily: "Lato",
                    color: Colors.black,
                    decoration: TextDecoration.underline
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}