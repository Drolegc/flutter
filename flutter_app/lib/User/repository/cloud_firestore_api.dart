import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user.dart';

class CloudFirestoreAPI {

  //Collections
  final String USERS = "users";
  final String PLACE = "places";

  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);

    return ref.setData({
      'uid':user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.imgProfile,
      'myPlaces': user.myPlaces,
      'myFavoritesPlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    },merge: true);
  }
}