import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:isikawa_sightseeing_app/components/detail_map.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';
import 'package:isikawa_sightseeing_app/view/navigation.dart';

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
        title: Text(
          touristSpot.name,
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
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
                  trailing: ClipOval(
                    child: InkWell(
                      child: const SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.map_rounded),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailMap(touristSpot: touristSpot),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
