import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';

import 'package:latlong2/latlong.dart';

class DetailMap extends StatefulWidget {
  const DetailMap({
    required this.touristSpot,
    super.key,
  });

  final TouristSpot touristSpot;

  @override
  State<DetailMap> createState() => _DetailMapState();
}

class _DetailMapState extends State<DetailMap> {
  Future<LatLng> touristSpotLatLogSearch() async {
    String touristSpotAdress = widget.touristSpot.address;
    List<Location> touristSpotLatLog =
        await locationFromAddress(touristSpotAdress);
    double latitude = touristSpotLatLog[0].latitude;
    double longitude = touristSpotLatLog[0].longitude;
    return LatLng(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: touristSpotLatLogSearch(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FlutterMap(
              options: MapOptions(
                center: snapshot.data,
                zoom: 9.2,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('エラーが発生しました: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
