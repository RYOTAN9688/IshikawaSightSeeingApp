import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';

class TouristSpotWidget extends StatelessWidget {
  const TouristSpotWidget({
    super.key,
    required this.touristSpots,
    //required this.onEntryTapped,
  });

  final List<TouristSpot> touristSpots;
  //final Function(TouristSpot) onEntryTapped;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: touristSpots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 8.0 / 9.0,
      ),
      itemBuilder: (context, index) {
        final entry = touristSpots[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 18 / 12,
                child: Image.network(entry.url, fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(entry.district),
                    Text(
                      entry.name,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(entry.address)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
