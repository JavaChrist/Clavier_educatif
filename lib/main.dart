import 'package:flutter/material.dart';
import 'screens/keyboard_screen.dart'; // Vérifie que le fichier existe

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clavier Éducatif',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const KeyboardScreen(), // Charge directement l'écran du clavier
    );
  }
}
