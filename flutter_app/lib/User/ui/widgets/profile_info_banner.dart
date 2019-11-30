import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/model/user.dart';
import 'package:flutter_app/User/ui/widgets/user_info.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileInfoBanner extends StatelessWidget{

  UserBloc userBloc;
  User user;

  ProfileInfoBanner();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
        // ignore: missing_return
      builder: (BuildContext context,AsyncSnapshot snapshot){
        switch(snapshot.connectionState){

          case ConnectionState.waiting:
            print("waiting");
            return CircularProgressIndicator();
          case ConnectionState.none:
            //none es por si no hay un stream
            print("none");
            return CircularProgressIndicator();
          case ConnectionState.active:
            print("active");
            return this.showProfileData(snapshot);
          case ConnectionState.done:
            print("done");
            return this.showProfileData(snapshot);
        }
      }
    );

  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("Usuario no logueado");
      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
        ),
        height: 70.0,
        width: 70.0,
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar los datos")
          ],
        ),
      );
    }else{
      print("Datos");
      user = User(name: snapshot.data.displayName,imgProfile: snapshot.data.photoUrl);
      return  UserInfo(user: this.user);
    }
  }

}