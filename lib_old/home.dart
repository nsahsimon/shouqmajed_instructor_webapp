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
  '1',
  '2',
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
    _tooltipBehavior = TooltipBehavior();
    Future(()async{
      List<String> temp_courses = await getInstructorsCourses();
      setState(() {
        courses.addAll(temp_courses);
        //courses = temp_courses;
      });
    });
    super.initState();
  }

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
        child: Column(
          children: [
            SizedBox(
              height: 110,
              width: 1600,
              child: Container(
                color: Color.fromARGB(255, 126, 13, 13),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 1, 1, 1),
                          child: Image(
                            image: AssetImage('images/UoB.png'),
                            width: 110,
                            height: 100,
                          ),
                        ),
                        Image(
                          image: AssetImage('images/un.png'),
                          width: 200,
                          height: 90,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // search menue
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 1, 1200, 1),
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 1350,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        //////////////////////////////////////////////////////// First Line
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 70,
                            ),
                            Text(
                              'Courses',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '*',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 90, 4, 4),
                              ),
                            ),
                            SizedBox(width: 300),
                            Text(
                              'Course Section',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '*',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 90, 4, 4),
                              ),
                            ),
                            SizedBox(width: 300),
                            Text(
                              'Date',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '*',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 90, 4, 4),
                              ),
                            ),
                          ],
                        ),
                        //////////////////////////////////////////////////////// Seconed Line
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            // course box
                            SizedBox(width: 30),
                            SizedBox(
                              width: 250,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(
                                      color: Color.fromARGB(255, 126, 13, 13)),
                                ),
                                child: //Row(
                                    //children: [
                                    //SizedBox(width: 150,),
                                    DropdownButtonCourse(),
                                //],
                                //),
                              ),
                            ),
                            // section box
                            SizedBox(
                              width: 150,
                            ),
                            SizedBox(
                              width: 250,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(
                                      color: Color.fromARGB(255, 126, 13, 13)),
                                ),
                                child: DropdownButtonSection(),
                              ),
                            ),
                            // date box
                            SizedBox(
                              width: 150,
                            ),
                            SizedBox(
                              width: 290,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(
                                      color: Color.fromARGB(255, 126, 13, 13)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      _dateTime.toString(),
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    IconButton(
                                      icon:
                                          Icon(Icons.calendar_month, size: 25),
                                      color: Color.fromARGB(255, 126, 13, 13),
                                      onPressed: _showDatePicker,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // submit button
                            SizedBox(width: 70),
                            SizedBox(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  isVisible = !isVisible;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 126, 13, 13),
                                ),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = isVisible;
                                  });
                                },
                                child: Text("Show")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //////////////////////////// Chart
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(270, 50, 100, 0),
                  child: Visibility(
                    visible: !isVisible,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 1000,
                      height: 500,
                      child: SfCircularChart(
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                          PieSeries<GDPData, String>(
                            dataSource: _chartData,
                            xValueMapper: (GDPData data, _) => data.Status,
                            yValueMapper: (GDPData data, _) => data.number,
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                            ),
                            enableTooltip: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ////////////////////////////////////////////////// Footer
            Footer(
                child: Container(
              width: 1550,
              height: 370,
              color: Colors.grey[400],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Quick Links",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ), //BB
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(500, 1, 1, 1),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu_book,
                          size: 40,
                        ),
                        blackBoardUrl(),
                      ],
                    ),
                  ), //SIS
                  Padding(
                    padding: const EdgeInsets.fromLTRB(800, 1, 1, 1),
                    child: Row(
                      children: [
                        Icon(
                          Icons.school,
                          size: 40,
                        ),
                        SIS(),
                      ],
                    ),
                  ), //SIS
                  Padding(
                    padding: const EdgeInsets.fromLTRB(500, 1, 1, 1),
                    child: Row(
                      children: [
                        Icon(
                          Icons.villa,
                          size: 40,
                        ),
                        UOB(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 1420,
                        height: 100,
                        color: Colors.grey[500],
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                  child: Image(
                                    image: AssetImage('images/instagram1.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                  child: Image(
                                    image: AssetImage('images/twitter.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                  child: Image(
                                    image: AssetImage('images/facebook.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                  child: Image(
                                    image: AssetImage('images/youtube.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Attended", 20),
      GDPData("Absent", 2),
    ];
    return chartData;
  }

  //////////////// blackboard url
  Widget blackBoardUrl() {
    final Uri url = Uri.parse("https://blackboard.uob.edu.bh/ultra/stream");
    return ElevatedButton(
        onPressed: () {
          launchUrl(url);
        },
        child: Text("data"));
  }

  //////////////// Sis url
  Widget SIS() {
    final Uri url =
        Uri.parse("https://sis.uob.edu.bh/uob_sis_prod/Default.aspx");
    return ElevatedButton(
        onPressed: () {
          launchUrl(url);
        },
        child: Text("data"));
  }

  //////////////// UOB url
  Widget UOB() {
    final Uri url = Uri.parse("https://www.uob.edu.bh");
    return ElevatedButton(
        onPressed: () {
          launchUrl(url);
        },
        child: Text("data"));
  }

  //////////////// INSTAGRAM url
  Widget INSTAGRAM() {
    final Uri url = Uri.parse("https://www.uob.edu.bh");
    return ElevatedButton(
        onPressed: () {
          launchUrl(url);
        },
        child: Text("data"));
  }

  //////////////// FACEBOOK url
  Widget FACEBOOK() {
    final Uri url = Uri.parse("https://www.uob.edu.bh");
    return ElevatedButton(
        onPressed: () {
          launchUrl(url);
        },
        child: Text("data"));
  }

  //////////////// TWITTER url
  Widget TWITTER() {
    final Uri url = Uri.parse("https://www.uob.edu.bh");
    return ElevatedButton(
        onPressed: () {
          launchUrl(url);
        },
        child: Text("data"));
  }
}

////////////////////////////////////////////////// chart
class GDPData {
  GDPData(this.Status, this.number);
  final String Status;
  final int number;
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
        //Courses
        ListTile(
          leading: const Icon(Icons.menu_book),
          title: const Text('Attendence'),
          onTap: () {
            Navigator.pushNamed(context, '/attendence');
          },
        ),
        ListTile(
          leading: const Icon(Icons.file_copy_outlined),
          title: const Text('Excuses'),
          onTap: () {
            Navigator.pushNamed(context, '/excuses');
          },
        ),
        const Divider(
          color: Colors.black,
        ),

        //LogOut
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text('Log Out'),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
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
