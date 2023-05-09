import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instructor/home.dart';
import 'package:instructor/utils/auth.dart' as auth;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void startLoading() {
    debugPrint("Started loading");
    setState(() {
      isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  FocusNode inputNode = FocusNode();
// to open keyboard call this function;
  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        //backgroundColor: Colors.grey[300],
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/UOB6-2.png"),
              fit: BoxFit.cover,
            ),
          ),
          /*decoration: BoxDecoration(
              color: Color.fromARGB(255, 105, 14, 8)
            ),*/
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                //decoration: BoxDecoration(
                //image: DecorationImage(
                child: Image(
                  image: AssetImage('images/UoB.png'), width: 170, height: 170,
                  //Image.asset('images/UoB-removebg.png'),
                ),
              ),
              //),
              //),
              //Hello again
              SizedBox(height: 10),
              Center(
                child: Text(
                  'University Of Bahrain',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  'Student Attendence System',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              /* SizedBox(height: 10),
                  Text(
                  'Welcome back',
                   style: TextStyle(
                    fontSize: 18,
                    ),
                  ),*/
              SizedBox(height: 50),

              //email textfield
              Padding(
                padding: const EdgeInsets.fromLTRB(290, 1, 290, 1),
                child: TextField(
                  controller: usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),
              //password textfiled
              Padding(
                padding: const EdgeInsets.fromLTRB(290, 1, 290, 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Password',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // sign in buttun
              Container(
                height: 60, //60 360
                width: 360,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 90, 4, 4),
                    border: Border.all(
                      color: Color.fromARGB(255, 90, 4, 4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(100) //12
                    ),
                child: GestureDetector(
                  onTap: () async {
                    startLoading();
                    await auth.loginUser(
                        email: usernameController.text,
                        password: passwordController.text,
                        context: context);
                    stopLoading();
                    // Navigator.pushNamed(context, '/home');
                  },
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Color.fromARGB(255, 140, 21, 21),
                  // ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
