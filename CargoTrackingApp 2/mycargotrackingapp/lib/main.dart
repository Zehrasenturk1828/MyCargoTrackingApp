import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mycargotrackingapp/screens/Anaekran.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cargo Tracking App',
      home: Cargotrackingapp(),
    ),
  );
}

class Cargotrackingapp extends StatelessWidget {
  const Cargotrackingapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Anaekran();
  }
}
