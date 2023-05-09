import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:studentapp/models/course.dart';

// Future<List<Course>> getAllCourses() async{
//   List<Course> courses = [];
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   QuerySnapshot courseSnapshots = await db.collection("courses").get();
//   List<QueryDocumentSnapshot> courseDocs = courseSnapshots.docs;
//   for(QueryDocumentSnapshot doc in courseDocs) {
//     courses.add(Course.fromfirestore(doc));
//   }
//   return courses;
// }

Future<List<String>> getInstructorsCourses() async {
  List<String> courses = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await db.collection("courses").where("instructors", arrayContains: auth.currentUser!.uid).get();
  List<QueryDocumentSnapshot> docs = querySnapshot.docs;
  for(QueryDocumentSnapshot doc in docs) {
    Map<String, dynamic>  data = doc.data() as Map<String, dynamic>;
    courses.add(data['code']);
  }
  return courses;
}


