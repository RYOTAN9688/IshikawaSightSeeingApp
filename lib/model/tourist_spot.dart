import 'package:cloud_firestore/cloud_firestore.dart';

class TouristSpot {
  const TouristSpot({
    required this.district,
    required this.name,
    required this.address,
    required this.url,
    required this.tel,
    required this.timeFromStation,
    required this.businessHours,
    required this.holiday,
    required this.homepageLink,
  });

  final String district;
  final String name;
  final String address;
  final String url;
  final String tel;
  final String timeFromStation;
  final String businessHours;
  final String holiday;
  final String homepageLink;

  factory TouristSpot.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return TouristSpot(
      district: data['district'],
      name: data['name'],
      address: data['address'],
      url: data['url'],
      tel: data['tel'],
      timeFromStation: data['timeFromStation'],
      businessHours: data['businessHours'],
      holiday: data['holiday'],
      homepageLink: data['homepageLink'],
    );
  }
}
