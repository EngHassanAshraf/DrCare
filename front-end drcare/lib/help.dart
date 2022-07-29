// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical_project/Models/drawer.dart';
import 'package:medical_project/styles/prjcolors.dart';

import './generated/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Help.tr()),
        backgroundColor: ProjectColors.primary_color_blue,
      ),
      endDrawer: DefaultDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                // ignore: prefer_const_constructors
                child: Center(
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Container(
                width: double.infinity,
                // ignore: prefer_const_constructors
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      LocaleKeys.Help_text.tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
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
        ),
      ),
    );
  }
}
