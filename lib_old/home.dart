//import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:flutter/material.dart';
import 'package:instructor/utils/firestore/read.dart';
import 'package:instructor/widgets/firebase_image.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/user_data.dart';

List<String> courses = <String>[""];
const List<String> section = <String>[
  '',
  '      1      ',
  '      2      ',
];

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   //Date Picker
  DateTime _dateTime = DateTime.now();
  bool isVisible = true;
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
  // Chart
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    Future(()async{
      List<String> temp_courses = await getInstructorsCourses();
      setState(() {
        courses.addAll(temp_courses);
        //courses = temp_courses;
      });
    });
    super.initState();
  }
  // checkbox
  bool? isChecked1 = true;
  bool? isChecked2 = true;
  bool? isChecked3 = false;
  bool? isChecked4 = true;
  bool? isChecked5 = true;
  bool? isChecked6 = true;
  bool? isChecked7 = true;
  bool? isChecked8 = false;
  bool? isChecked9 = true;
  bool? isChecked10 = true;
  /////////////////////////
  bool? excused1 = false;
  bool? excused2 = false;
  bool? excused3 = false;
  bool? excused4 = false;
  bool? excused5 = false;
  bool? excused6 = false;
  bool? excused7 = false;
  bool? excused8 = false;
  bool? excused9 = false;
  bool? excused10 = false;
  @override
  Widget build(BuildContext context) {
    // Header
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color.fromARGB(255, 126, 13, 13),
      ),

      drawer: const CustomNavigationDrawer() ,
      backgroundColor: Colors.grey[300],
      // Logo section
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              width: 1440, height: 500,
            alignment: Alignment.center,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/uob3.jpeg"),
                fit: BoxFit.cover,
                ),
            ),
            child: Column(children: [
              Row(children: [
                SizedBox(height: 20,),
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
              ],),
              SizedBox(height: 80,),
              Row(children: [
                  Column(
                children: [
                  SizedBox(height: 150, width: 1350,
                    child:
                  Container(
                    decoration: BoxDecoration(color: Color.fromARGB(179, 161, 157, 157),
                    border: Border.all(color: Colors.grey)
                    ),
                    child: Column(
                      children: [
                        //////////////////////////////////////////////////////// First Line
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
                        //////////////////////////////////////////////////////// Seconed Line 
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
                              child: DropdownButtonCourse(),
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
                            SizedBox(width: 250, height: 40,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white70,
                              border: Border.all(color: Color.fromARGB(255, 126, 13, 13)),
                              ),
                              child: Row(
                                children: [
                                  Text(_dateTime.toString(), style: TextStyle(fontSize: 15),),
                                  SizedBox(width: 30,),
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
                            SizedBox(width: 40),
                            SizedBox( width: 80, height: 40,
                              child: ElevatedButton(onPressed: (){
                                isVisible = !isVisible;
                                            },
                                style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 126, 13, 13),
                                 ),
                              child: Text('Start',
                              style: TextStyle(fontSize: 16),
                              ),
                              ),
                            ),
                            SizedBox(width: 30,),
                             const VerticalDivider(color: Colors.black,),
                            SizedBox( width:80, height: 40,
                           child: ElevatedButton(onPressed: (){},style:ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 126, 13, 13)),
                           child: Text("End",style: TextStyle(fontSize: 16),)
                           ),
                         ),
                        ],
                        ),
                      ],
                    ),
                  ))
                  ],
              ),
            ],),
            ]
            ),
      ),
                Row(
                children: [
                  SizedBox(width: 100,height: 150,),
                  Text('Dashboard',
                   style: TextStyle(
                    fontSize: 30, 
                    fontWeight:FontWeight.bold),
                    ),
                    TextButton(onPressed: (){setState(() {isVisible = isVisible;});}, child: Text("Show")),
                ],
              ),
              //////////////////////////// Chart
            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(270, 1, 100, 0),
                child: Visibility(
                  visible: !isVisible,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    width: 1000, height: 600,
                    child: SfCircularChart(
                      legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                      tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries> [
                      PieSeries<GDPData,String>(
                        dataSource: _chartData,
                        xValueMapper: (GDPData data,_) => data.Status,
                        yValueMapper: (GDPData data,_) => data.number,
                        pointColorMapper: (GDPData data, _) => data.color,
                        dataLabelSettings: DataLabelSettings(isVisible:true,), enableTooltip: true, 
                      ),
                    ],),
                  ),
                ),
              ),
            ],
            ), 
            SizedBox( width: 1300,
              child: const Divider(color: Colors.grey,)),
            Row(
              children: [
                SizedBox(width: 100,height: 100,),
                Text("Attendence Sheet",
                    style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                    ),                     
              ],
            ),
            //////////////////////////////////////////////////////////////////////////////////////////// Table
            Row(children: [
              SizedBox(width: 55,),
                Container( margin: EdgeInsets.all(10),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(220.0),  
                    border: TableBorder.all(  
                        color: Colors.grey,  
                        style: BorderStyle.solid,  
                        width: 2),  
                    children: [  
                      TableRow(decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 126, 13, 13),
                        ),
                        ///////////////////////Headers
                      children: [  
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child:Column(children:[Text('ID', style: TextStyle(fontSize: 20.0,color: Colors.white))]),  
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child:Column(children:[Text('Name', style: TextStyle(fontSize: 20.0,color: Colors.white))]),  
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child:Column(children:[Text('Attendence Status', style: TextStyle(fontSize: 20.0,color: Colors.white))]),  
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child:Column(children:[Text('Absences', style: TextStyle(fontSize: 20.0,color: Colors.white))]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Mark Attendence', style: TextStyle(fontSize: 20.0,color: Colors.white))]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Excused', style: TextStyle(fontSize: 20.0,color: Colors.white))]),
                        ),  
                      ]),  
                      /////////////////////////////// Data table
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20198626',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Shouq Faisl')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked1==false)Text('Absent'),if(isChecked1==true)Text('Present'),if(excused1==true&&isChecked1==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('0')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked1,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked1 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused1,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused1 = newBool;
                           });}
                           )]),
                        ),   
                      ]),  ////////////////////////////////// 2
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20193615',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Ali Mohammed')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked2==false)Text('Absent'),if(isChecked2==true)Text('Present'),if(excused2==true&&isChecked2==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('2')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked2,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked2 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused2,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused2 = newBool;
                           });}
                           )]),
                        ),   
                      ]),   ////////////////////////////////// 3
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20197166',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Salman Ahmed')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked3==false)Text('Absent'),if(isChecked3==true)Text('Present'),if(excused3==true&&isChecked3==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('1')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked3,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked3 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused3,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused3 = newBool;
                           });}
                           )]),
                        ),   
                      ]),
                        ////////////////////////////////// 4
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20193121',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Fatima Abdulla')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked4==false)Text('Absent'),if(isChecked4==true)Text('Present'),if(excused4==true&&isChecked4==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('1')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked4,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked4 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused4,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused4 = newBool;
                           });}
                           )]),
                        ),   
                      ]),
                      ////////////////////////////////// 5
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20196728',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Mohammed Ali')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked5==false)Text('Absent'),if(isChecked5==true)Text('Present'),if(excused5==true&&isChecked5==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('3')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked5,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked5 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused5,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused5 = newBool;
                           });}
                           )]),
                        ),   
                      ]),
                      ////////////////////////////////// 6
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20195489',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Sara Abdulaziz')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked6==false)Text('Absent'),if(isChecked6==true)Text('Present'),if(excused6==true&&isChecked6==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('0')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked6,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked6 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused6,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused6 = newBool;
                           });}
                           )]),
                        ),   
                      ]),
                      ////////////////////////////////// 7
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20201956',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Yousuf Khalil')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked7==false)Text('Absent'),if(isChecked7==true)Text('Present'),if(excused7==true&&isChecked7==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('5')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked7,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked7 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused7,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused7 = newBool;
                           });}
                           )]),
                        ),   
                      ]),
                      ////////////////////////////////// 8
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20202021',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Lulwa Mohammed')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked8==false)Text('Absent'),if(isChecked8==true)Text('Present'),if(excused8==true&&isChecked8==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('2')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked8,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked8 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused8,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused8 = newBool;
                           });}
                           )]),
                        ),   
                      ]),
                      ////////////////////////////////// 9
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20204083',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Ahmed Ali')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked9==false)Text('Absent'),if(isChecked9==true)Text('Present'),if(excused9==true&&isChecked9==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('0')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked9,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked9 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused9,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused9 = newBool;
                           });}
                           )]),
                        ),   
                      ]),
                      ////////////////////////////////// 10
                      TableRow( children: [  
                        Padding( padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('20203767',style: TextStyle(color: Color.fromARGB(255, 126, 13, 13)),)]),
                        ),  
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('Mariam Majed')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[if(isChecked10==false)Text('Absent'),if(isChecked10==true)Text('Present'),if(excused10==true&&isChecked10==false)Text('Excused')]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Text('3')]),
                        ), 
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: isChecked10,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             isChecked10 = newBool;
                           });}
                           )]),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(children:[Checkbox(value: excused10,activeColor: Colors.blue,
                           onChanged: (newBool){setState(() {
                             excused10 = newBool;
                           });}
                           )]),
                        ),   
                      ]),
                      
                    ],  
                  ),  
                ),  
              ],),
              ////////////////// Save
              Padding(
                padding: const EdgeInsets.fromLTRB(500, 20, 500, 20),
                child: SizedBox( width:80, height: 40,
                             child: ElevatedButton(onPressed: (){},style:ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 126, 13, 13)),
                             child: Text("Save",style: TextStyle(fontSize: 16),)
                             ),
                           ),
              ),
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
      )
    );
  }

  List<GDPData> getChartData(){
      final List<GDPData> chartData = [
        GDPData("Attended", 20, Color.fromARGB(255, 77, 104, 131)),//255, 77, 104, 131
        GDPData("Absent", 2, Color.fromARGB(255, 140, 146, 153)),
      ];
      return chartData;
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
    //////////////// YOUTUBE url
    Widget YOUTUBE(){
      final Uri url= Uri.parse("https://youtube.com/@uobedubh");
      return TextButton(onPressed: (){launchUrl(url);},
       child: Container(child: Image(image: AssetImage('images/youtube.png'),width: 40,height: 40,),)
      );
    }
}


////////////////////////////////////////////////// chart
class GDPData {
  GDPData(this.Status, this.number, this.color);
  final String Status;
  final int number;
  final color;
  
}

/////////////////////////////////////////////////////////////////////////////////////// Navigation bar
Widget buildHeader(BuildContext context) => Container(
      color: Color.fromARGB(255, 126, 13, 13),
      padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 75,
            child: FirebaseImage(
              imageUrl: myUserData.profilePicUrl,
            ),
          ),
          SizedBox(height: 12,),
          Text(
            myUserData.name,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );

Widget buildMenuItms(BuildContext context) => Wrap(
      runSpacing: 12, //vertical
      children: [
        //Home Menu
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.file_copy_outlined),
          title: const Text('Excuses'),
          onTap: () {
            Navigator.pushNamed(context, '/excuses');
          },
        ),
        const Divider(color: Colors.black,),
        // Language
        ListTile(
          leading: const Image(image: AssetImage("images/globe.png"),width: 20,height: 20,),
          title: const Text('Language'),
          onTap: (){},
        ),
        const Divider(color: Colors.black,),
        //LogOut
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text('Log Out'),
          onTap: (){
            Navigator.pushNamed(context, '/');
          },
        ),
         const Divider(color: Colors.black,),
        
      ],
    );



class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItms(context),
          ],
        ),
      ),
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
  String dropdownValue = courses.first;

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
      items: courses.map<DropdownMenuItem<String>>((String value) {
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
class CheckBoxModal{
  String title;
  bool value;
  CheckBoxModal({required this.title, this.value = false});
}