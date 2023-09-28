import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:isikawa_sightseeing_app/model/tourist_spot.dart'; // Firestore パッケージのインポート // データモデルのインポート

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<TouristSpot>> getTouristSpots() async {
    try {
      final snapshot = await _firestore.collection('tourist_spot').get();
      final entries =
          snapshot.docs.map((doc) => TouristSpot.fromFirestore(doc)).toList();
      return entries;
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching getTouristSpots : $e');
      return [];
    }
  }

  Future<void> addTouristSpotsEntry(TouristSpot touristSpot, File file) async {
    try {
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Firebase Storageに写真をアップロードする
      TaskSnapshot snapshot =
          await _storage.ref('photos/$fileName').putFile(file);

      // アップロードした写真のURLを取得する
      String url = await snapshot.ref.getDownloadURL();
      await _firestore.collection('tourist_spot').add({
        'district': touristSpot.district,
        'name': touristSpot.name,
        'address': touristSpot.address,
        'url': url,
        'tel': touristSpot.tel,
        'timeFromStation': touristSpot.timeFromStation,
        'businessHours': touristSpot.businessHours,
        'holiday': touristSpot.holiday,
        'homepageLink': touristSpot.homepageLink,
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error adding touristSpot: $e');
    }
  }
}
