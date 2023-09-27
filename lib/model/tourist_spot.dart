import 'package:cloud_firestore/cloud_firestore.dart';

enum District {
  all,
  kanazawa,
  kaga,
  noto,
}

class TouristSpot {
  const TouristSpot({
    required this.id,
    required this.district,
    required this.name,
    required this.address,
  });

  final int id;
  final District district;
  final String name;
  final String address;

  String get assetName => 'assets/images/$id.jpeg';

  factory TouristSpot.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return TouristSpot(
      id: data['id'] as int,
      district: data['district'],
      name: data['name'],
      address: data['address'],
    );
  }
}
