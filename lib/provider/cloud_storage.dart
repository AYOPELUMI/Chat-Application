import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class CloudStorageService {
  static const String bucketName = 'bucket-name';

  static CloudStorageService instance = CloudStorageService();

  FirebaseStorage _storage = FirebaseStorage.instance;
  late Reference _baseRef;

  CloudStorageService() {
    _baseRef = _storage.ref();
  }
  String _path = "profile_images";

  Future<TaskSnapshot> uploadFile(String fileName, File data) async {
    try {
      return _baseRef.child(_path).child(fileName).putFile(data);
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
