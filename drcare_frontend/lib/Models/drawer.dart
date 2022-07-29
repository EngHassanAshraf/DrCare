// ignore_for_file: prefer_const_constructors, implementation_imports, use_key_in_widget_constructors

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/about.dart';
import 'package:medical_project/help.dart';
import 'package:medical_project/settings.dart';
import 'package:medical_project/styles/prjcolors.dart';

import '../generated/locale_keys.g.dart';
import '../home_screen.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        padding: EdgeInsets.zero,

        children: [
          DrawerHeader(
            child: Text(
              LocaleKeys.Medical_analysis.tr(),
              style: TextStyle(fontSize: 25.0),
            ),
            decoration: BoxDecoration(
              color: ProjectColors.primary_color_blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text(
              LocaleKeys.home.tr(),
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          Container(
            color: Colors.black54,
            child: SizedBox(
              height: 1.0,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings_solid,
            ),
            title: Text(
              LocaleKeys.settings.tr(),
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
          Container(
            color: Colors.black54,
            child: SizedBox(
              height: 1.0,
            ),
          ),
          ListTile(
            leading: Icon(Icons.help_center_outlined),
            title: Text(
              LocaleKeys.Help.tr(),
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpScreen()));
            },
          ),
          Container(
            color: Colors.black54,
            child: SizedBox(
              height: 1.0,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.exclamationmark_circle_fill),
            title: Text(
              LocaleKeys.about.tr(),
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutScreen()));
            },
          ),
          Container(
            color: Colors.black54,
            child: SizedBox(
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
