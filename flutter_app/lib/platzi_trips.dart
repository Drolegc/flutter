import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/screens/home_trips.dart';
import 'package:flutter_app/Place/ui/screens/search_trips.dart';
import 'package:flutter_app/User/ui/screens/profile_trips.dart';

class PlatziTrips extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlatziTrips>{

  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips()
  ];

  void onTapTapped(int index){

    setState(() {
      this.index_tap = index;
    });
  }

  int index_tap = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:this.widgetsChildren[this.index_tap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.deepPurple
        ),
        child:BottomNavigationBar(
          items:[
            BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
              title: Text("Home")
          ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.comment,
                size:30.0
              ),
              title: Text("Comment")
            ),
        BottomNavigationBarItem(
            icon: Icon(
                Icons.child_care,
                size:30.0
            ),
            title: Text("Profile")
        )
          ],
          onTap: this.onTapTapped,
          currentIndex: this.index_tap,
        )
      )
    );


  }

}