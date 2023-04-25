import 'package:flutter/material.dart';

import 'home.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class attendence extends StatefulWidget {
  const attendence({super.key});

  @override
  State<attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<attendence> {
  //Date Picker
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
      showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(2022), 
        lastDate: DateTime(2030),
        ).then((value) {
            setState(() {
              _dateTime = value!;
            });
        });
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendence'),
        backgroundColor: Color.fromARGB(255, 126, 13, 13),
      ),

      drawer: const CustomNavigationDrawer() ,
      backgroundColor: Colors.grey[350],
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
            // search engine
            SizedBox(height:80,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 1, 1100, 1),
              child: Text('Attendence Sheet',
               style: TextStyle(
                fontSize: 30, 
                fontWeight:FontWeight.bold),
                ),
            ),
              SizedBox(height: 20,),
            Column(
          children: [
            SizedBox(height: 150, width: 1350,
              child:
            Container(
              decoration: BoxDecoration(color: Colors.white70,
              border: Border.all(color: Colors.grey)
              ),
              child: Column(
                children: [
                  // First Line
                  Row(
                    children: [
                      SizedBox(width: 50, height: 70,),
                     Text('Courses',
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     ),
                     ),
                     SizedBox(width: 5),
                     Text('*',
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 90, 4, 4),
                     ),
                     ),
                     SizedBox(width: 300),
                     Text('Course Section',
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     ),
                     ),
                     SizedBox(width: 5),
                     Text('*',
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 90, 4, 4),
                     ),
                     ),
                     SizedBox(width: 300),
                     Text('Date',
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     ),
                     ),
                     SizedBox(width: 5),
                     Text('*',
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 90, 4, 4),
                     ),
                     ),
                    ],
                  ),
                  // Seconed Line 
                  SizedBox(height: 1,),
                  Row(
                      children: [
                        // course box
                        SizedBox(width: 30),
                        SizedBox(width: 250, height: 40,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white70,
                          border: Border.all(color: Color.fromARGB(255, 126, 13, 13)),
                          ),
                          child:
                              DropdownButtonCourse(),
                        ),
                        ),
                        // section box
                        SizedBox(width: 150,),
                        SizedBox(width: 250, height: 40,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white70,
                          border: Border.all(color: Color.fromARGB(255, 126, 13, 13)),
                          ),
                          child: DropdownButtonSection(),
                        ),
                        ),
                        // date box
                        SizedBox(width: 150,),
                        SizedBox(width: 290, height: 40,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white70,
                          border: Border.all(color: Color.fromARGB(255, 126, 13, 13)),
                          ),
                          child: Row(
                            children: [
                              Text(_dateTime.toString(), style: TextStyle(fontSize: 15),),
                              SizedBox(width: 80,),
                              IconButton(
                                icon:Icon(
                                  Icons.calendar_month,
                                  size:25),
                                  color: Color.fromARGB(255, 126, 13, 13),
                                  onPressed: _showDatePicker,
                      ),
                            ],
                          ),
                        ),
                        ),
                        // submit button
                        SizedBox(width: 70),
                        SizedBox( width: 150, height: 40,
                          child: ElevatedButton(onPressed: (){
                                        },
                            style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 126, 13, 13),
                             ),
                          child: Text('Submit',
                          style: TextStyle(fontSize: 20),
                          ),
                          ),
                        ),
                    ],
                    )
                ],
              ),
            ),
            ),
          ],
        ),
          ],
        ),
        
      ),
    );
  }
}


// drop down list function

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return //Padding(
      //padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
      /*child: Row(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          Container(
            //padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            decoration: BoxDecoration(color: Colors.white70,
             border: Border.all(color: Color.fromARGB(255, 126, 13, 13)),
             ),*/
            // dropDown Button
            /*child:*/ DropdownButton<String>(
              //value: dropdownValue,
              icon: const Icon(Icons.arrow_downward, size: 10,),
              //elevation: 16,
              style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 126, 13, 13)),
              /*underline: Container(
                height: 2,
                color: Color.fromARGB(255, 126, 13, 13),
              ),*/
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
    );
  }
}

///////////////////////////////////////////////////////////////////// course dropdown button
 
 
 class DropdownButtonCourse extends StatefulWidget {
  const DropdownButtonCourse({super.key});

  @override
  State<DropdownButtonCourse> createState() => _DropdownButtonCourseState();
}

class _DropdownButtonCourseState extends State<DropdownButtonCourse> {
  String dropdownValue = course.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      
      value: dropdownValue,
      //icon: const Icon(Icons.arrow_downward,),
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      /*underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),*/
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: course.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////// section dropdown list
class DropdownButtonSection extends StatefulWidget {
  const DropdownButtonSection({super.key});

  @override
  _DropdownButtonSectionState createState() => _DropdownButtonSectionState();
}

class _DropdownButtonSectionState extends State<DropdownButtonSection> {
  String dropdownValue = section.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: section.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
