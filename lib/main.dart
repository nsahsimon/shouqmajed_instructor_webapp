import 'package:flutter/material.dart';

import 'package:instructor/Excuses.dart';
import 'package:instructor/attendence.dart';
import 'package:instructor/login.dart';
import 'package:instructor/home.dart';
import 'package:instructor/attendence.dart';
import 'package:instructor/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized()

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
    routes: {
      '/': (context) => login(),
      '/home': (context) => Home(),
      '/attendence': (context) => attendence(),
      '/excuses': (context) => Excuses(),
    },
  ));
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("A test screen"),
        ),
        body: Center(
          child: Text("A test hello hi screen"),
        ));
  }
}
