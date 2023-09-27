import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:isikawa_sightseeing_app/model/tourist_spot.dart'; // Firestore パッケージのインポート // データモデルのインポート

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<TouristSpot>> getTouristSpots() async {
    try {
      final snapshot = await _firestore.collection('tourist_spot').get();
      final entries =
          snapshot.docs.map((doc) => TouristSpot.fromFirestore(doc)).toList();
      return entries;
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching diary entries: $e');
      return [];
    }
  }

  Future<void> addTouristSpotsEntry(TouristSpot touristSpot) async {
    try {
      await _firestore.collection('tourist_spot').add({
        'id': touristSpot.id,
        'district': touristSpot.district,
        'name': touristSpot.name,
        'adress': touristSpot.address,
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error adding touristSpot: $e');
    }
  }
  // 他の操作を追加
}
