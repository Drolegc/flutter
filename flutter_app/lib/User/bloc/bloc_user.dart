import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_app/User/repository/auth_repository.dart';


class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos - Stream
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> _streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => this._streamFirebase;

  //Casos de uso
  //1. SignIn a la app Google
  Future<FirebaseUser> signIn(){
    return this._auth_repository.signInFirebase();
  }

  void signOut(){
    this._auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose


  }

}