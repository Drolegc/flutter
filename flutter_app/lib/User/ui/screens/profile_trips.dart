import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/widgets/place_info.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileTrips extends StatelessWidget{

  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    this.userBloc = BlocProvider.of<UserBloc>(context);


    return StreamBuilder(
      stream: userBloc.placesList,
      builder: (context, AsyncSnapshot snp){
        switch(snp.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            print(snp.data.documents);
            return Container(
              color:Colors.white,
              child: ListView(
                children: userBloc.buildPlaces(snp.data.documents),
              ),
            );
          case ConnectionState.active:
            return Container(
              color:Colors.white,
              child: ListView(
                children: userBloc.buildPlaces(snp.data.documents),
              ),
            );
          case ConnectionState.none:
            return CircularProgressIndicator();
        }
      },
    );
    /*return Container(
      color:Colors.white,
      child: ListView(
        children: <Widget>[
          PlaceInfo(),
          PlaceInfo(),
          PlaceInfo(),
          PlaceInfo(),
          PlaceInfo(),
          PlaceInfo(),
        ],
      ),
    );*/
  }

}