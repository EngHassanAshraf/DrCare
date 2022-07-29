// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_print, implementation_imports

import 'dart:convert';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/Models/drawer.dart';
import 'package:medical_project/animiacovidresult.dart';
import 'package:medical_project/apiHandler.dart';
import 'package:medical_project/generated/locale_keys.g.dart';
import 'package:medical_project/Models/result.dart';
import 'package:medical_project/home_screen.dart';
import 'package:medical_project/routes.dart';
import 'package:medical_project/select_photo.dart';
import 'package:medical_project/styles/prjcolors.dart';
import 'Models/person.dart';
import 'Models/result.dart';
import 'package:http/http.dart' as http;

class AfterResult extends StatefulWidget {
  final http.Client client;
  Person person;
  var result;
  AfterResult(this.person, {required this.client, required this.result});
  @override
  State<AfterResult> createState() => _AfterResultState();
}

class _AfterResultState extends State<AfterResult> {
  var routes = Routes().getroutes();
  var finalResult;

  callclasifyocr() async {
    Uri ocrClassify = Uri.parse(routes[0]["OCRClassify"]!);
    var req = await widget.client.get(ocrClassify);
    setState(() {});
    print(req.request);
    return (req.body);
  }

  callclasifyvalues({
    required hemoglobin,
    required mch,
    required mchc,
    required mcv,
    required wbc,
    required mot,
    required lyt,
  }) async {
    Uri veluesClassify = Uri.parse(routes[0]["EnteredValuesClassify"]);
    var req = await widget.client.post(veluesClassify, body: {
      "hemoglobin": "$hemoglobin",
      "mch": "$mch",
      "mchc": "$mchc",
      "mcv": "$mcv",
      "wbc": "$wbc",
      "mot": "$mot",
      "lyt": "$lyt"
    });
    setState(() {});
    print(req.request);
    return req.body;
  }

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
          backgroundColor: ProjectColors.primary_color_blue,
          title: Text(
            LocaleKeys.test_result.tr(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return buildResulItem(widget.person.results[index]);
                  },
                  itemCount: widget.person.results.length,
                  // separatorBuilder: (BuildContext context, int index) {
                  //   return Divider(
                  //     color: Colors.white,
                  //   );
                ),
              ),
            ),
            widget.person.isTranslation
                ? Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50.0,
                        child: MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
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
                  )
                : Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50.0,
                        child: MaterialButton(
                          onPressed: () async {
                            if (widget.person.isOCRTest) {
                              finalResult = await callclasifyocr();

                              widget.person = APIHandler().enterResult(
                                  person: widget.person,
                                  finalfinal: finalResult);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnimiaCovidResult(
                                    widget.person,
                                  ),
                                ),
                              );
                            } else {
                              finalResult = await callclasifyvalues(
                                hemoglobin: widget.person.results[1].value,
                                mch: widget.person.results[3].value,
                                mchc: widget.person.results[4].value,
                                mcv: widget.person.results[2].value,
                                wbc: widget.person.results[0].value,
                                mot: widget.person.results[6].value,
                                lyt: widget.person.results[5].value,
                              );
                              APIHandler().enterResult(
                                  person: widget.person,
                                  finalfinal: finalResult);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnimiaCovidResult(
                                    widget.person,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            LocaleKeys.last_results.tr(),
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
    );
  }
}
