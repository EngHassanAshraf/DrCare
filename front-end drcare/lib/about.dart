// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical_project/Models/drawer.dart';
import 'package:medical_project/generated/locale_keys.g.dart';
import 'package:medical_project/styles/prjcolors.dart';

import './generated/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static const ImageProvider aya_Image =
      AssetImage('assets/images/Aya_Abdalrahman.jpg');
  static const ImageProvider hassan_Image =
      AssetImage('assets/images/Hassan Ashraf.jpg');
  static const ImageProvider elmaadawy_Image =
      AssetImage('assets/images/elmaadawy.png');
  static const ImageProvider nasser_Image =
      AssetImage('assets/images/nasser.jpg');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DefaultDrawer(),
      appBar: AppBar(
        title: Text(LocaleKeys.about.tr()),
        backgroundColor: ProjectColors.primary_color_blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  LocaleKeys.about_screen.tr(),
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Project Team',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: aya_Image,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Aya Abdalrahman',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Team Leader',
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CircleAvatar(
                              radius: 40.0,
                              backgroundImage: hassan_Image,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Hassan Ashraf',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Full Stack',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CircleAvatar(
                              radius: 40.0,
                              backgroundImage: elmaadawy_Image,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Ahmed Elmaadawy',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Flutter Developer',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CircleAvatar(
                              radius: 40.0,
                              backgroundImage: nasser_Image,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Ahmed Nasser',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'AI Developer',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CircleAvatar(
                              radius: 40.0,
                              //TODO: abdelrahman image
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Abdalrahman',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'oraby',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'AI Developer',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // CircleAvatar(
              //   radius: 200.0,
              //   child: Image.asset('assets/images/"Aya_Abdalrahman.jpg"'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
