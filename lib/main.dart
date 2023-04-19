import 'package:flutter/material.dart';

import 'package:instructor/Excuses.dart';
import 'package:instructor/attendence.dart';
import 'package:instructor/login.dart';
import 'package:instructor/home.dart';
import 'package:instructor/attendence.dart';

void main() async { 
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
    
   runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner:false,
    theme: ThemeData(primarySwatch: Colors.red),
    routes: {
          

      '/':(context) => login(),
      '/home':(context) => Home(),
      '/attendence':(context) => attendence(),
      '/excuses':(context) => Excuses(),
    },
  ));
}
