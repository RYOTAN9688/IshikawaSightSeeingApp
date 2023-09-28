import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.textController,
    required this.textlabel,
    super.key,
  });

  final TextEditingController textController;
  final String textlabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 100,
      child: TextField(
        controller: textController,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: textlabel,
        ),
      ),
    );
  }
}
