// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_project/styles/prjcolors.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';

class DrCare extends StatefulWidget {
  DrCare({Key? key}) : super(key: key);

  @override
  State<DrCare> createState() => _DrCareState();
}

class _DrCareState extends State<DrCare> {
  DateTime timeBackPress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // final dif = DateTime.now().difference(timeBackPress);
        // final isExitWarning = dif >= Duration(seconds: 2);
        // timeBackPress = DateTime.now();
        // if (isExitWarning) {
        //   const msg = "press back again to exit";
        //   Fluttertoast.showToast(
        //     msg: msg,
        //     fontSize: 18,
        //     backgroundColor: Color.fromARGB(150, 0, 0, 0),
        //   );
        //   return false;
        // } else {
        //   Fluttertoast.cancel();
        //   return true;
        // }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DrCare()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: ProjectColors.primary_color_blue,
        appBar: AppBar(
          elevation: 0,
          // ignore: deprecated_member_use
          backwardsCompatibility: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ProjectColors.primary_color_blue,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: ProjectColors.primary_color_blue,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/images/drcare.jpeg')),
                Text(
                  "\nBe Aware, Be Save",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: ProjectColors.primary_color_blue,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
