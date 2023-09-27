enum District {
  all,
  kanazawa,
  kaga,
  noto,
}

class TouristSpot {
  const TouristSpot({
    required this.district,
    required this.id,
    required this.name,
    required this.address,
  });
  final District district;
  final int id;
  final String name;
  final String address;

  String get assetName => 'assets/images/$id.jpeg';
}
