// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, override_on_non_overriding_member, annotate_overrides, await_only_futures, unused_local_variable, unused_catch_clause, avoid_print, unnecessary_this, implementation_imports, must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_project/Models/person.dart';
import 'package:medical_project/after_result.dart';
import 'dart:io';

import 'package:medical_project/Models/drawer.dart';
import 'package:medical_project/animiacovidresult.dart';
import 'package:medical_project/apiHandler.dart';
import 'package:medical_project/generated/locale_keys.g.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:medical_project/loadingscreen.dart';
import 'package:medical_project/routes.dart';
import 'package:medical_project/styles/prjcolors.dart';
import 'package:path/path.dart';

import 'personal_information.dart';

class ChoosePhoto extends StatefulWidget {
  http.Client client = http.Client();
  Person person;
  ChoosePhoto(this.person, {Key? key}) : super(key: key);
  @override
  State<ChoosePhoto> createState() => _ChoosePhotoState();
}

class _ChoosePhotoState extends State<ChoosePhoto> {
  File? image;
  var ocrResult;
  Map<String, dynamic> leukemiaResult = {};

  var clientResult = '';

  var routes = Routes().getroutes();
  bool loading = false;

  Future pickImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick an image: $e');
    }
  }

  getOCRresult() async {
    var request = http.MultipartRequest('POST', Uri.parse(routes[1]["OCR"]));

    if (image == null) return {"": ""};
    var pickimg = http.MultipartFile.fromPath(
      'image',
      image!.path,
      filename: basename(image!.path),
      contentType: MediaType.parse('multipart/form-data'),
    );

    request.files.add(await pickimg);

    //TODO: Remove Print Lines

    print("Request: $request\n");
    var res = await request.send();
    var finalresult =
        json.decode(String.fromCharCodes(await res.stream.toBytes()));

    setState(() {});
    return finalresult;
  }

  getLeukemiaResult() async {
    var request =
        http.MultipartRequest('POST', Uri.parse(routes[0]["CallLeukemia"]));

    if (image == null) return {"": ""};
    var pickimg = http.MultipartFile.fromPath(
      'image',
      image!.path,
      filename: basename(image!.path),
      contentType: MediaType.parse('multipart/form-data'),
    );

    request.files.add(await pickimg);
    //TODO: Remove Print Lines

    print("Request: $request\n");
    var res = await request.send();

    var analysisResult =
        json.decode(String.fromCharCodes(await res.stream.toBytes()));

    setState(() {});
    return analysisResult;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PersonalInformation()),
        );
        return false;
      },
      child: loading
          ? Loading()
          : Scaffold(
              endDrawer: DefaultDrawer(),
              appBar: AppBar(
                backgroundColor: ProjectColors.primary_color_blue,
                title: Text(
                  LocaleKeys.Select_photo.tr(),
                  style: TextStyle(
                    // fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        child: MaterialButton(
                          onPressed: () {
                            var fromcamera = false;
                            pickImage(source: ImageSource.gallery);
                          },
                          child: Text(
                            LocaleKeys.gallery.tr(),
                            style: TextStyle(
                                fontSize: 20.0,
                                color: ProjectColors.button_text_color),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: ProjectColors.primary_color_blue,
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            pickImage(source: ImageSource.camera);
                          },
                          child: Text(
                            LocaleKeys.open_camera.tr(),
                            style: TextStyle(
                                fontSize: 20.0,
                                color: ProjectColors.button_text_color),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: ProjectColors.primary_color_blue,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: image != null
                                ? Image.file(image!)
                                : Container(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Icon(
                                          Icons.image_outlined,
                                          size: 100.0,
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                          LocaleKeys.no_image.tr(),
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.black26),
                                  ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50.0,
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: () {
                                  widget.person.isLeukemiaTest = false;
                                  widget.person.isOCRTest = false;
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  LocaleKeys.previous.tr(),
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
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
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              height: 50.0,
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: () async {
                                  if (image == null) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text(
                                          LocaleKeys.warning.tr(),
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        content:
                                            Text(LocaleKeys.have_choose.tr()),
                                        actions: <Widget>[
                                          Center(
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(LocaleKeys.ok.tr()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    if (!(widget.person.isLeukemiaTest)) {
                                      setState(() => loading = true);
                                      ocrResult = await getOCRresult();
                                      if (ocrResult == null) {
                                        setState(() => loading = false);
                                      }
                                      widget.person = await APIHandler()
                                          .insertValuesFunction(
                                        person: widget.person,
                                        finalResult: ocrResult,
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AfterResult(
                                              widget.person,
                                              client: widget.client,
                                              result: ocrResult),
                                        ),
                                      );
                                    } else {
                                      print(widget.person.isLeukemiaTest);
                                      print(widget.person.isOCRTest);
                                      setState(() => loading = true);
                                      leukemiaResult =
                                          await getLeukemiaResult();
                                      if (leukemiaResult == null) {
                                        setState(() => loading = false);
                                      }
                                      APIHandler().enterResult(
                                          person: widget.person,
                                          finalfinal: leukemiaResult);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AnimiaCovidResult(widget.person),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  LocaleKeys.next_button.tr(),
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
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
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
