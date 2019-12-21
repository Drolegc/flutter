import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/Place/ui/widgets/place_info.dart';
import 'package:flutter_app/User/model/user.dart';
import 'package:flutter_app/User/ui/screens/profile_trips.dart';

class CloudFirestoreAPI {

  //Collections
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);

    return await ref.setData({
      'uid':user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.imgProfile,
      'myPlaces': user.myPlaces,
      'myFavoritesPlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    },merge: true);
  }

  Future<void> updatePlaceData(Place place) async {

    CollectionReference refPlaces = _db.collection(PLACES);
    await this._auth.currentUser().then((FirebaseUser user){
      refPlaces.add(
          {
            'name':place.name,
            'description':place.description,
            'urlImage':place.urlImage,
            'user':_db.document("${USERS}/${user.uid}")//reference
          }
      ).then((DocumentReference dr){
        dr.get().then((DocumentSnapshot snp){
          snp.documentID;//ID del place que se acaba de subir REFERENCIA ARRAY
          print("Mostrando data de la IMAGEEEN!!: ");
          print(snp);
          DocumentReference refUser = _db.collection(USERS).document(user.uid);
          refUser.updateData({
            "myPlaces":FieldValue.arrayUnion([_db.document("${PLACES}/${snp.documentID}")])
          });
        });
      });
    });
    /*

    Otra forma

    FirebaseUser user = await _auth.currentUser();
    DocumentReference _userRef = _db.collection(this.USERS).document(user.uid);
    return _ref.add({
      'name': place.name,
      'description':place.description,
      'user':_userRef//reference
    })
    */

  }

  List<PlaceInfo> buildPlaces(List<DocumentSnapshot> placesListSnapshot){
    List<PlaceInfo> profilePlaces = List<PlaceInfo>();
    placesListSnapshot.forEach((p){
      profilePlaces.add(PlaceInfo(
        place: Place(
          name: p.data['name'],
          urlImage: p.data['urlImage'],
          description: p.data['description']
        ),
      ));
    });
    return profilePlaces;
  }
}