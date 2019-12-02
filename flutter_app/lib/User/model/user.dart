import 'package:flutter/material.dart';
import 'package:flutter_app/Place/model/place.dart';

class User {

  final String uid;
  final String email;
  final String imgProfile;
  final String name;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;

  User({
    Key key,
    @required this.imgProfile,
    @required this.name,
    @required this.uid,
    this.email,
    this.myPlaces,
    this.myFavoritePlaces,
  });

}