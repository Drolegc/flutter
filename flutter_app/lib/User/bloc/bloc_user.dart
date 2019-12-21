import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/Place/repository/firebase_storage_repo.dart';
import 'package:flutter_app/Place/ui/widgets/place_info.dart';
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
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();
  Stream<QuerySnapshot> _placesListStream = Firestore.instance.collection("places").snapshots(); //Toma una pic de toda la data de los places y mantente a la escucha

  Stream<QuerySnapshot> get placesList => this._placesListStream;
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

  //Subiendo actualizando data
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepo.updatePlaceData(place);

  final _firebaseStorageRepo = FirebaseStorageRepo();

  //Subir imagen a firebase storage
  Future<StorageUploadTask> uploadFile(String path,File imagen) => _firebaseStorageRepo.uploadFile(path, imagen);

  //Traer lista de objetos PlaceInfo
  List<PlaceInfo> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepo.buildPlaces(placesListSnapshot);

  @override
  void dispose() {
    // TODO: implement dispose


  }

}