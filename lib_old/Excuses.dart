import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';


class Excuses extends StatefulWidget {
  const Excuses({super.key});
  @override
  State<Excuses> createState() => _ExcusesState();
}
  class _ExcusesState extends State<Excuses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excuses'),
        backgroundColor: Color.fromARGB(255, 126, 13, 13),
      ),

      drawer: const CustomNavigationDrawer() ,
      // Logo section
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 110, width: 1600,
              child:
            Container(
              color: Color.fromARGB(255, 126, 13, 13),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 1, 1, 1),
                        child: Image( image: AssetImage(
                          'images/UoB.png'),
                           width: 110, height: 100,
                              ),
                      ),
                      Image( image: AssetImage(
                          'images/un.png'),
                          width:150 , height:90 ,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ),
            //First Line
            Column(children: [
                Row(
                  children: [
                    SizedBox(width: 100, height: 170,),
                Text("Inboxing",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ],),
                SizedBox(height: 20,),
                Row(
                  children: [
                      SizedBox(width: 90,),
                      Text('Student ID',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 350,),
                      Text("Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 310,),
                      Text('Course / Sections',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 100,),
                      Text("Download",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],),
                  // Seconed Line
                  SizedBox(height: 25,),
                      SizedBox(
                    width: 1300 ,
                    child: const Divider(color: Colors.black, thickness: 2,)
                      ),
                  SizedBox(height: 70,),
                  Row(children: [
                    SizedBox(width: 90,),
                      Text('20193615',
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 250,),
                      Text("Hello Dr this is an excuse file for the lecture in date 20th march",
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 140,),
                      Text('ITIS 333 / Sec 1',
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 160,),
                      Excuse1(),
                  ],),
                  //Third Line
                  SizedBox(height: 140,),
                  SizedBox(
                    width: 1300 ,
                    child: const Divider(color: Colors.black, thickness: 2,)
                    ),
                  SizedBox(height: 70,),
                  Row(children: [
                    SizedBox(width: 90,),
                      Text('20202021',
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 390,),
                      Text("Null",
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 380,),
                      Text('ITIS 265 / Sec 2',
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 160,),
                      IconButton(
                        icon:Icon(
                          Icons.download,
                          size:30),
                      color: Color.fromARGB(255, 5, 40, 182),
                      onPressed: () {
                        /////
                      },
                      ),
                  ],),
                  SizedBox(height: 80,),
            ////////////////////////////////////////////////// Footer
            Footer(child: Container( width: 1620, height: 255, color: Colors.grey[400],
              child: 
              Column(
                children: [
                  SizedBox(height: 20,),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Quick Links",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                    ],),//BB
                    SizedBox(height: 40,),
                      Padding(
                      padding: const EdgeInsets.fromLTRB(100, 1, 1, 1),
                      child: Row(children: [
                        // BB
                        SizedBox(width: 150,),
                              Icon(Icons.menu_book,size: 35,),
                               blackBoardUrl(),
                          //SIS//////////////////////
                          SizedBox(width: 150,),
                         Icon(Icons.school,size: 35,),
                         SIS(),
                          //UOB
                          SizedBox(width: 150,),
                        Icon(Icons.villa,size: 35,),
                        UOB(),
                      ],),
                    ), SizedBox(height: 25,),
                    // seconed container
                    Row(children: [
                        Container( width: 1430, height: 100, color: Colors.grey[500],
                          child: Row(children: [
                          INSTAGRAM(),
                          TWITTER(),
                          FACEBOOK(),
                          YOUTUBE(),
                          SizedBox(width: 380,),
                          Text("© 2023 By University Of Bahrain",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(width: 500,),
                          Image(image: AssetImage(
                          'images/UoB.png'),
                           width: 100, height: 90,)
                          ],),)
                      ],),
                ]
                ,)
                ,)
            ),
            ],
            ),
          ],
        ),
      ),


    );
  }
}
//////////////// blackboard url
    Widget blackBoardUrl(){
      final Uri url= Uri.parse("https://blackboard.uob.edu.bh/ultra/stream");
      return TextButton( 
        onPressed: (){launchUrl(url);},
        child: Text("BlackBoard Learning",
        style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
        )
      );
    }
    //////////////// Sis url
    Widget SIS(){
      final Uri url= Uri.parse("https://sis.uob.edu.bh/uob_sis_prod/Default.aspx");
      return TextButton(
        onPressed: (){launchUrl(url);},
        child: Text("Student Information System",
        style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
        )
      );
    }
    ///////////////////// UOB url
    Widget UOB(){
      final Uri url= Uri.parse("https://www.uob.edu.bh");
      return GestureDetector(
        child: TextButton(
          onPressed: (){launchUrl(url);},
          child: Text("University Of Bahrain",
          style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
          )
        ),
      );
    }
    //////////////// INSTAGRAM url
    Widget INSTAGRAM(){
      final Uri url= Uri.parse("https://instagram.com/uobedubh?igshid=YmMyMTA2M2Y=");
      return TextButton(onPressed: (){launchUrl(url);},
       child: Container(child: Image(image: AssetImage('images/instagram1.png'),width: 40,height: 40,),)
      );
    }
    //////////////// FACEBOOK url
    Widget FACEBOOK(){
      final Uri url= Uri.parse("https://www.facebook.com/MyUOB");
      return TextButton(onPressed: (){launchUrl(url);},
       child: Container(child: Image(image: AssetImage('images/facebook.png'),width: 40,height: 40,),)
      );
    } 
    //////////////// TWITTER url
    Widget TWITTER(){
      final Uri url= Uri.parse("https://twitter.com/uobedubh?s=21");
      return TextButton(onPressed: (){launchUrl(url);},
       child: Container(child: Image(image: AssetImage('images/twitter.png'),width: 40,height: 40,),)
      );
    }
    //////////////// TWITTER url
    Widget YOUTUBE(){
      final Uri url= Uri.parse("https://youtube.com/@uobedubh");
      return TextButton(onPressed: (){launchUrl(url);},
       child: Container(child: Image(image: AssetImage('images/youtube.png'),width: 40,height: 40,),)
      );
    }
    //////////////// Excuse1 url
    Widget Excuse1(){
      final Uri url= Uri.parse("https://pdf.ac/2i87nl");
      return IconButton(
                        icon:Icon(
                          Icons.download,
                          size:30),
                      color: Color.fromARGB(255, 5, 40, 182),
                      onPressed: (){launchUrl(url);},
      );
    }
    //////////////// Excuse2 url
    Widget Excuse2(){
      final Uri url= Uri.parse("https://twitter.com/uobedubh?s=21");
      return IconButton(
                        icon:Icon(
                          Icons.download,
                          size:30),
                      color: Color.fromARGB(255, 5, 40, 182),
                      onPressed: (){launchUrl(url);},
      );
    }
