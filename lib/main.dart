import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:isikawa_sightseeing_app/firebase_options.dart';
import 'view/screens/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: StartScreen(),
      ),
    );
  }
}
