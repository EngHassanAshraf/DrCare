// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:medical_project/styles/prjcolors.dart';

class ResultModel {
  String name;
  String strValue = "0.0";
  double value = 0.0;
  String translation;
  TextEditingController controller = TextEditingController();

  ResultModel({
    required this.name,
    required this.translation,
  });
  ResultModel.addNewValue(
      {required this.name, required this.translation, required this.strValue});
}

Widget buildResulItem(ResultModel results) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 80.0,
                child: Center(
                  child: Text(
                    results.name,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: ProjectColors.button_text_color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 80.0,
              child: Center(
                child: Text(
                  results.strValue,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: ProjectColors.button_text_color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 350.0,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Center(
                      child: Text(
                        results.translation,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0,
                            color: ProjectColors.button_text_color),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ProjectColors.primary_color_blue,
        ),
      ),
    );
