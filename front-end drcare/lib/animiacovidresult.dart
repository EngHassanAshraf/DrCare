// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import './generated/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_project/styles/prjcolors.dart';

import 'Models/drawer.dart';
import 'Models/person.dart';
import 'apiHandler.dart';
import 'generated/locale_keys.g.dart';
import 'home_screen.dart';
import 'select_photo.dart';

class AnimiaCovidResult extends StatefulWidget {
  final Person person;
  // var covidanimiaresult;
  AnimiaCovidResult(
    this.person, {
    Key? key,
  }) : super(key: key);

  @override
  State<AnimiaCovidResult> createState() => _AnimiaCovidResultState();
}

class _AnimiaCovidResultState extends State<AnimiaCovidResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  var recommendation =
      """It is possible that you suffer from anemia, so our advice to you is to visit a hematologist.
And before you go, you should know:
1. Anemia occurs when you have a decreased level of hemoglobin in your red blood cells (RBCs)
And until this time you should know:

1. Diets that include the following foods can help treat or prevent iron deficiency:
-dark green, leafy vegetables
-dried fruits
-nuts
-iron-fortified cereals

2. Additionally, vitamin C helps your body absorb iron. If you’re taking iron tablets, a doctor might suggest taking the tablets along with a source of vitamin C, such as a glass of orange juice or citrus fruit.
Treating the underlying cause of bleeding
""";
  DateTime timeBackPress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChoosePhoto(widget.person)),
        );
        return false;
      },
      child: Scaffold(
        endDrawer: DefaultDrawer(),
        appBar: AppBar(
          title: Text(
            LocaleKeys.result_recommendation.tr(),
            style: TextStyle(fontSize: 17.0),
          ),
          backgroundColor: ProjectColors.primary_color_blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        LocaleKeys.your_final_result.tr(),
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                widget.person.isLeukemiaTest
                    ? Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.person.hasLukemia
                                ? LocaleKeys.leukemia_true.tr()
                                : LocaleKeys.leukemia_false.tr(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.blue[100],
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                widget.person.hasAnimea
                                    ? LocaleKeys.animea_true.tr()
                                    : LocaleKeys.anemia_false.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue[100],
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                widget.person.hasCovid
                                    ? LocaleKeys.covid_true.tr()
                                    : LocaleKeys.covid_false.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue[100],
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50.0,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Text(
                          LocaleKeys.home.tr(),
                          style: TextStyle(
                              fontSize: 20.0,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
