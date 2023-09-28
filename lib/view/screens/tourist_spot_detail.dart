import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';

class TouristSpotDetail extends StatelessWidget {
  const TouristSpotDetail({
    required this.touristSpot,
    super.key,
  });
  final TouristSpot touristSpot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(touristSpot.name),
      ),
      body: Column(
        children: [
          Image.network(touristSpot.url),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(touristSpot.address),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
