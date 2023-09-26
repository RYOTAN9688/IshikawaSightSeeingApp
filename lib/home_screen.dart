import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              'assets/images/hyakumansan.jpeg',
              fit: BoxFit.contain,
            ),
          ),
          Text('石川をもっと楽しもう！')
        ],
      ),
    );
  }
}
