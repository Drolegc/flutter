import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/User/model/user.dart';
import 'package:flutter_app/User/repository/cloud_firestore_repo.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_app/User/repository/auth_repository.dart';


class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos - Stream
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => this.streamFirebase;

  //Casos de uso
  //1. SignIn a la app Google
  Future<FirebaseUser> signIn(){
    return this._auth_repository.signInFirebase();
  }

  //2. Registro y actualizacion en base de datos
  final _cloudFirestoreRepo = CloudFirestoreRepo();
  void updateUserData(User user) => _cloudFirestoreRepo.updateUserDataFirestore(user);

  void signOut(){
    this._auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose


  }

}