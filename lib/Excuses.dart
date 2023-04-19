import 'package:flutter/material.dart';

import 'home.dart';

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

      drawer: const NavigationDrawer() ,
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
                          width:200 , height:90 ,
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
                      Text('Student ID',
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 390,),
                      Text("Description",
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 340,),
                      Text('Course / Sections',
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 140,),
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
                  //Third Line
                  SizedBox(height: 140,),
                  SizedBox(
                    width: 1300 ,
                    child: const Divider(color: Colors.black, thickness: 2,)
                    ),
                  SizedBox(height: 70,),
                  Row(children: [
                    SizedBox(width: 90,),
                      Text('Student ID',
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 390,),
                      Text("Description",
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 340,),
                      Text('Course / Sections',
                      style: TextStyle(
                        fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 140,),
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
            ],
            ),
          ],
        ),
      ),


    );
  }
}