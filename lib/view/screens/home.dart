import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:isikawa_sightseeing_app/components/tourist_spot_widget.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';
import 'package:isikawa_sightseeing_app/service/firestore_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TouristSpot> _touristSpots = [];

  @override
  void initState() {
    super.initState();
    _loadTouristSpots();
  }

  Future<void> _loadTouristSpots() async {
    final firestoreService = FirestoreService();
    final entries = await firestoreService.getTouristSpots();
    setState(() {
      _touristSpots = entries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'おすすめスポット',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
      ),
      body: TouristSpotWidget(
        touristSpots: _touristSpots,
      ),
    );
  }
}
