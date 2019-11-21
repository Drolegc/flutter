import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/gradient_back.dart';
import 'package:flutter_app/platzi_trips.dart';
import 'package:flutter_app/widgets/button_green.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class SignInScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen>{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    this.userBloc = BlocProvider.of(context); // El provider ubicado arriba en el arbol y en el main me devolvera el UserBloc

    return this._handleCurrentSession();
  }

  void onPressed(){
    userBloc.signIn().then((FirebaseUser user) => print("Name: ${user.displayName}") );
  }

  Widget _handleCurrentSession(){
  //Manejador de sesion - Que pantalla mostrar segun el stream

    return StreamBuilder(
      stream: this.userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //Veremos que pasa con el stream desde aqui
        //snapshot - data - Obj
        if(!snapshot.hasData || snapshot.hasError){
          return this.signInGoogleUI();
        }else{
          return PlatziTrips();
        }
      },
    );

  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(1.0,""),
          Column(
            mainAxisAlignment: MainAxisAlignment.center, //Vertical aligment
            children: <Widget>[
              Text(
                  "Welcome \n Lets log in!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 37,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(
                text: "Login with Google",
                onPressed: this.onPressed,
                width: 300.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }

}