// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/check_disease.dart';
import 'package:medical_project/Models/drawer.dart';
import 'package:medical_project/drcare.dart';
import 'package:medical_project/personal_information.dart';
import './generated/locale_keys.g.dart';
import 'styles/prjcolors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ismedicaltest = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DrCare()),
        );
        return false;
      },
      child: Scaffold(
        endDrawer: DefaultDrawer(),
        appBar: AppBar(
          backgroundColor: ProjectColors.primary_color_blue,
          title: Text(LocaleKeys.Medical_analysis.tr()),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      LocaleKeys.welcome_txt.tr(),
                      style: TextStyle(
                          fontSize: 23.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ismedicaltest = true;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children:
                            // ignore: prefer_const_literals_to_create_immutables
                            [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage('assets/images/test.png'),
                              height: 80.0,
                              width: 80.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            LocaleKeys.medical_test.tr(),
                            style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      color: ismedicaltest
                          ? ProjectColors.primary_color_blue
                          : Colors.grey[500],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ismedicaltest = false;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children:
                            // ignore: prefer_const_literals_to_create_immutables
                            [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              color: Colors.white,
                              image: AssetImage('assets/images/doctor.png'),
                              height: 80.0,
                              width: 80.0,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            LocaleKeys.health.tr(),
                            style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      color: ismedicaltest
                          ? Colors.grey[500]
                          : ProjectColors.primary_color_blue,
                    ),
                  ),
                ),
              ),
            ),
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
                          builder: (context) => ismedicaltest
                              ? PersonalInformation()
                              : Selectdisease()),
                    );
                  },
                  child: Text(
                    LocaleKeys.next_button.tr(),
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: ProjectColors.button_text_color),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  color: ProjectColors.primary_color_blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
