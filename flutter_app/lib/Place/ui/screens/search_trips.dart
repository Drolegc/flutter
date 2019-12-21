import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/ui/screens/profile_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SearchTrips extends StatelessWidget{

  UserBloc _userBloc;
  @override
  Widget build(BuildContext context) {

    this._userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
    return test();
  }

  Widget test(){
    return StreamBuilder<FirebaseUser>(
      stream: _userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
        switch(snapshot.connectionState){

          case ConnectionState.none:
            // TODO: Handle this case.
            return CircularProgressIndicator();
            break;
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.active:
            // TODO: Handle this case.
          return ProfileTrips();
            break;
          case ConnectionState.done:
            // TODO: Handle this case.
            return ProfileTrips();
            break;
        }
        return null;
      },
    );
  }
}