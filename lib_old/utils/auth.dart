// import 'dart:html';
import "dart:html";
import 'dart:io';

import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:instructor/data/user_data.dart";
import "package:path/path.dart" as path;
import "package:instructor/home.dart";

import "../models/user_data.dart";

Future<void> loginUser(
    {required String email,
    required String password,
    required BuildContext context}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    debugPrint('Logged in user: ${userCredential.user!.email}');

    if (await getUserDataFromFirestore()) {
      // Navigate to the home screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      debugPrint('Wrong password provided for that user.');
    } else {
      debugPrint('Error: ${e.message}');
    }
  } catch (e) {
    debugPrint('Error: $e');
  }
}

// Get user details from firestore
Future<bool> getUserDataFromFirestore() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    debugPrint("Getting instructor data from firestore");
    DocumentSnapshot userDoc = await db.collection("instructors").doc(auth.currentUser!.uid).get();
    debugPrint("User Id: ${auth.currentUser!.uid}");
    if(userDoc.exists) debugPrint("User exists");
    else debugPrint("user doesn't exist");
    myUserData = UserData.fromFirestore(userDoc);
    debugPrint("Successfully retrieved instructor data from");
    return true;
  }catch(e) {
    debugPrint("$e");
    debugPrint("Something went wrong");
    debugPrint("Could not extract the instructors data from the database");
  }
  return false;
}
