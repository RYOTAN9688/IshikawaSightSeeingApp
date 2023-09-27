import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _image;

  final FirestoreService _firestoreService = FirestoreService();
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        return;
      }
      _image = File(pickedFile.path);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _saveTouristSpotEntry() async {
    final district = _districtController.text;
    final name = _nameController.text;
    final address = _addressController.text;

    final newEntry = TouristSpot(
      district: district,
      name: name,
      address: address,
      url: _image.toString(),
    );
    await _firestoreService.addTouristSpotsEntry(newEntry, _image!);

    setState(() {
      _districtController.clear();
      _nameController.clear();
      _addressController.clear();
    });

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
            IconButton(
              icon: const Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
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
