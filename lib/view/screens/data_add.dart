import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isikawa_sightseeing_app/components/custom_text_field.dart';

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
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _timeFromStationController =
      TextEditingController();
  final TextEditingController _businessHoursController =
      TextEditingController();
  final TextEditingController _holidayController = TextEditingController();
  final TextEditingController _homepageLinkController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();
  File? _image;

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
    final tel = _telController.text;
    final timeFromStation = _timeFromStationController.text;
    final businessHours = _businessHoursController.text;
    final holiday = _holidayController.text;
    final homepageLink = _homepageLinkController.text;

    final newEntry = TouristSpot(
      district: district,
      name: name,
      address: address,
      url: _image.toString(),
      tel: tel,
      timeFromStation: timeFromStation,
      businessHours: businessHours,
      holiday: holiday,
      homepageLink: homepageLink,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 5),
              CustomTextField(
                textController: _districtController,
                textlabel: '地域',
              ),
              const SizedBox(height: 5),
              CustomTextField(
                textController: _nameController,
                textlabel: '観光地',
              ),
              const SizedBox(height: 5),
              CustomTextField(
                textController: _addressController,
                textlabel: '住所',
              ),
              CustomTextField(
                textController: _telController,
                textlabel: '電話番号',
              ),
              CustomTextField(
                textController: _timeFromStationController,
                textlabel: '駅からの時間',
              ),
              CustomTextField(
                textController: _businessHoursController,
                textlabel: '営業時間',
              ),
              CustomTextField(
                textController: _holidayController,
                textlabel: '定休日',
              ),
              CustomTextField(
                textController: _homepageLinkController,
                textlabel: 'ホームページのリンク',
              ),
              Row(
                children: [
                  const Text('観光地の写真'),
                  IconButton(
                    icon: const Icon(Icons.photo_library),
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveTouristSpotEntry,
                child: const Text('保存する'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
