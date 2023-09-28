import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:isikawa_sightseeing_app/components/address_list_tile.dart';
import 'package:isikawa_sightseeing_app/components/custom_list_tile.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';
import 'package:url_launcher/link.dart';

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
                child: Column(
                  children: [
                    AddressListTile(touristSpot: touristSpot),
                    const Divider(
                      height: 0,
                      color: Color.fromARGB(255, 228, 228, 228),
                    ),
                    CustomListTile(
                      icon: Icons.call,
                      title: touristSpot.tel,
                    ),
                    CustomListTile(
                      icon: Icons.train,
                      title: touristSpot.timeFromStation,
                    ),
                    CustomListTile(
                      icon: Icons.schedule,
                      title: touristSpot.businessHours,
                    ),
                    CustomListTile(
                      icon: Icons.calendar_month,
                      title: touristSpot.holiday,
                    ),
                    Link(
                      uri: Uri.parse(touristSpot.homepageLink),
                      target: LinkTarget.blank,
                      builder: (context, FollowLink? openLink) {
                        return ListTile(
                          onTap: openLink,
                          leading: const Icon(Icons.phone_iphone),
                          title: const Text('公式ホームページ'),
                        );
                      },
                    ),
                    const Divider(
                      height: 0,
                      color: Color.fromARGB(255, 228, 228, 228),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
