import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
  final StorageReference _storageReference = FirebaseStorage.instance.ref();

  Future<StorageUploadTask> uploadFile(String path,File imagen) async{

    StorageUploadTask storageUploadTask = this._storageReference.child(path).putFile(imagen);
    return storageUploadTask;
  }
}