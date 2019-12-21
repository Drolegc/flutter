import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/Place/ui/widgets/card_image.dart';
import 'package:flutter_app/Place/ui/widgets/text_input_location.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/button.dart';
import 'package:flutter_app/gradient_back.dart';
import 'package:flutter_app/widgets/text_input.dart';
import 'package:flutter_app/widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class NewPlace extends StatefulWidget{

  File image;

  NewPlace({
    Key key,
    this.image
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewPlace();
  }

}

class _NewPlace extends State<NewPlace>{

  void Submit(){
    //1. Firebase Storage
    //Url
    //2. Cloud Firestore
    //Place

  }

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    // Controller por cada input
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            0.35,
            ""
          ),
          Row( //APPBAR
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0,left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left,color: Colors.black87,size: 45),
                    onPressed: (){
                      //Navegacion
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child:Container(
                    padding: EdgeInsets.only(top: 45.0,left: 20.0,right: 10.0),
                    child: TitleHeader(title: "Add a new place"),
                  ),
                )
            ],

          ),
          Container(
            margin: EdgeInsets.only(top: 120.0),
            child: ListView(
              padding: EdgeInsets.only(top: 0.0),
              children: <Widget>[
                Container(
                  child: CardImage(
                    height: 200.0,
                    width: 300.0,
                    left: 0.0,
                    icon: Icon(Icons.add_a_photo),
                    onPressed: () => print("click!!!"),
                    imagen: widget.image,
                  ),
                  margin: EdgeInsets.only(bottom: 20.0),
                  alignment: AlignmentDirectional.topCenter,
                ), // Foto
                Container( // TextField title
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                      hintText: "Title",
                      inputType: null,
                      controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add location",
                    iconData: Icons.location_on,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Button(
                    texto: "Submit",
                    onPressed: () {
/*
                      Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Subiendo..."),
                            duration: Duration(milliseconds: 500),
                          )
                      );
*/
                      //1. Firebase Storage
                      //Url
                      //UID logueado
                      userBloc.currentUser.then(
                          (FirebaseUser user) {
                            if(user != null){
                              String uid = user.uid;
                              String path = "${uid}/${DateTime.now().toString()}archivo.jpg";
                              userBloc.uploadFile(path, widget.image).then(
                                  (StorageUploadTask uploadFile){
                                    uploadFile.onComplete.then(
                                        (StorageTaskSnapshot snap){
                                          snap.ref.getDownloadURL().then(
                                              (urlImage){
                                                print("URL: ${urlImage}");
                                                //2. Cloud Firestore
                                                //Place
                                                userBloc.updatePlaceData(
                                                    Place(
                                                      name: _controllerTitlePlace.text,
                                                      description: _controllerDescriptionPlace.text,
                                                      urlImage: urlImage
                                                    )
                                                ).whenComplete((){
                                                  print("Place actualizado!!");
                                                  Navigator.pop(context);
                                                });
                                              }
                                          );
                                        }
                                    );
                                  }
                              );
                            }
                          }
                      );


                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}