import 'package:flutter/material.dart';
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
      ),
      itemBuilder: (context, index) {
        final entry = touristSpots[index];
        return Center(
          child: Column(
            children: [
              Text(entry.district),
              Text(entry.name),
              Text(entry.address)
            ],
          ),
        );
      },
    );
  }
}
