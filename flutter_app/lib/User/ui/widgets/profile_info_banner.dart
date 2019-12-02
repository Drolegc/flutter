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
      stream: userBloc.streamFirebase,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          return this.showProfileData(snapshot);
        }else{
          print("waiting");
          return CircularProgressIndicator();
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