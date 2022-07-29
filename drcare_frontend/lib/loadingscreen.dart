// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medical_project/styles/prjcolors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SpinKitPumpingHeart(
            size: 100,
            color: ProjectColors.primary_color_blue,
            duration: const Duration(milliseconds: 800),
          ),
        ),
      ),
    );
  }
}
