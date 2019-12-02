import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user.dart';
import 'package:flutter_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepo {

  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserDataFirestore(User user){
    return _cloudFirestoreAPI.updateUserData(user);
  }
}