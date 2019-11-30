import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'button_opt.dart';

class ButtonsBar extends StatelessWidget{

  UserBloc userBloc;

  void signOut(){
    userBloc.signOut();
  }

  @override
  Widget build(BuildContext context) {

    this.userBloc = BlocProvider.of(context);

    // TODO: implement build
    return Container(
      height: 100.0,
      color: Colors.lime,
      child: Row(
        children: <Widget>[
          ButtonOpt(icon: Icons.exit_to_app,onPressed: () => {userBloc.signOut()},),
          ButtonOpt(icon: Icons.add_a_photo),
          ButtonOpt(icon: Icons.vpn_key),
        ],
      ),
    );
  }

}
