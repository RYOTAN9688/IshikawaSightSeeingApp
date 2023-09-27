import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isikawa_sightseeing_app/model/tourist_spot.dart';
import 'package:isikawa_sightseeing_app/service/firestore_service.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();

  void _saveTouristSpotEntry() async {
    final id = _idController.value as int;
    final district = _districtController.text as District;
    final name = _nameController.text;
    final address = _addressController.text;

    final newEntry = TouristSpot(
      id: id,
      district: district,
      name: name,
      address: address,
    );
    await _firestoreService.addTouristSpotsEntry(newEntry);
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
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'id'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _districtController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: '地域'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: '観光地'),
            ),
            const SizedBox(height: 16),
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
