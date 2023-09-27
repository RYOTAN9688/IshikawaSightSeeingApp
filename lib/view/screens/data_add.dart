import 'package:flutter/material.dart';

import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';
import 'package:isikawa_sightseeing_app/service/firestore_service.dart';

class DataAddScreen extends StatefulWidget {
  const DataAddScreen({super.key});

  @override
  State<DataAddScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DataAddScreen> {
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();

  void _saveTouristSpotEntry() async {
    final district = _districtController.text;
    final name = _nameController.text;
    final address = _addressController.text;

    final newEntry = TouristSpot(
      district: district,
      name: name,
      address: address,
    );
    await _firestoreService.addTouristSpotsEntry(newEntry);
    _districtController.clear();
    _nameController.clear();
    _addressController.clear();

    _showSaveConfirmationModal();
  }

  void _showSaveConfirmationModal() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('保存完了'),
          content: const Text('データが保存されました。'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text('閉じる'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('観光スポットを追加'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            TextField(
              controller: _districtController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: '地域'),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _nameController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: '観光地'),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _addressController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: '住所'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveTouristSpotEntry,
              child: const Text('保存する'),
            ),
          ],
        ),
      ),
    );
  }
}
