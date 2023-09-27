import 'package:flutter/material.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Card> _buildGridCards(BuildContext context) {
    List<TouristSpot> touristSpot =
        TouristSpotRepository.loadTouristSpots(District.all);
    if (touristSpot.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return touristSpot.map((touristSpot) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 12,
              child: Image.asset(
                touristSpot.assetName,
                fit: BoxFit.fill,
              ),
            ),
            Text(touristSpot.name),
            Text(touristSpot.address),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
        ),
      ]),
    );
  }
}
