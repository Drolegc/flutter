import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_app/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepo {

  final _firebaseStorageAPI = FirebaseStorageAPI();

  Future<StorageUploadTask> uploadFile(String path,File imagen) => this._firebaseStorageAPI.uploadFile(path, imagen);
}