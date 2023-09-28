import 'package:flutter/material.dart';

import 'package:isikawa_sightseeing_app/components/detail_map.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';

class AddressListTile extends StatelessWidget {
  const AddressListTile({
    required this.touristSpot,
    super.key,
  });

  final TouristSpot touristSpot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
                builder: (context) => DetailMap(touristSpot: touristSpot),
              ),
            );
          },
        ),
      ),
    );
  }
}
