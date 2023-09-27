import 'package:cloud_firestore/cloud_firestore.dart';

class TouristSpot {
  const TouristSpot({
    required this.district,
    required this.name,
    required this.address,
    required this.url,
  });

  final String district;
  final String name;
  final String address;
  final String url;

  factory TouristSpot.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return TouristSpot(
      district: data['district'],
      name: data['name'],
      address: data['address'],
      url: data['url'],
    );
  }
}
