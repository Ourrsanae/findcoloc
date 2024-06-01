// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, library_private_types_in_public_api

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:findcoloc/DataUser/models.dart';
import 'package:findcoloc/themes/custom_scoffold.dart';
import 'package:findcoloc/themes/theme.dart';
import 'package:findcoloc/view/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({Key? key}) : super(key: key);

  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  List? _myLanguages, _myLifeStyle, _myPersonality, _myHobbies;
  Color selectedColor = lightColorScheme.shadow,
      selectedColor2 = lightColorScheme.shadow,
      selectedColor3 = lightColorScheme.shadow;
  String? status;

  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; // Set the initial value of text field
    super.initState();
    _myLanguages = [];
    _myLifeStyle = [];
    _myPersonality = [];
    _myHobbies = [];
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();

    return SafeArea(
      child: CustomScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 30),
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Text(
                    "Fill Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildStatusColumn(
                            "Student",
                            Icons.school,
                            selectedColor,
                                () {
                              setState(() {
                                selectedColor = (selectedColor == lightColorScheme.shadow)
                                    ? lightColorScheme.primary
                                    : lightColorScheme.shadow;
                                status = "Student";
                              });
                            },
                          ),
                          buildStatusColumn(
                            "Professional",
                            Icons.card_travel,
                            selectedColor2,
                                () {
                              setState(() {
                                selectedColor2 = (selectedColor2 == lightColorScheme.shadow)
                                    ? lightColorScheme.primary
                                    : lightColorScheme.shadow;
                                status = "Professional";
                              });
                            },
                          ),
                          buildStatusColumn(
                            "Freelancer",
                            Icons.computer,
                            selectedColor3,
                                () {
                              setState(() {
                                selectedColor3 = (selectedColor3 == lightColorScheme.shadow)
                                    ? lightColorScheme.primary
                                    : lightColorScheme.shadow;
                                status = "Freelancer";
                              });
                            },
                          ),
                        ],
                      ),
                      Form(
                        key: formState,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 40),
                            buildMultiSelectFormField(
                              "Languages",
                              "Please choose one or more",
                              listLanguages,
                              _myLanguages,
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                                  (value) {
                                setState(() {
                                  _myLanguages = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            buildMultiSelectFormField(
                              "Personality",
                              "Please choose one or more",
                              listPersonality,
                              _myPersonality,
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                                  (value) {
                                setState(() {
                                  _myPersonality = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            buildMultiSelectFormField(
                              "Lifestyle",
                              "Please choose one or more",
                              listLifestyle,
                              _myLifeStyle,
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                                  (value) {
                                setState(() {
                                  _myLifeStyle = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            buildMultiSelectFormField(
                              "Hobbies",
                              "Please choose one or more",
                              listHobbis,
                              _myHobbies,
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                                  (value) {
                                setState(() {
                                  _myHobbies = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: lightColorScheme.primary,
                                padding: const EdgeInsets.all(15),
                              ),
                              onPressed: () {
                                if (formState.currentState?.validate() ?? false) {
                                  formState.currentState?.save();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => homePage(),
                                    ),
                                  );
                                } else {
                                  // Show an error message or handle the invalid form state
                                }
                              },
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => homePage(),
                                      ),
                                          (route) => false, // Remove all routes on the stack
                                    );
                                  },
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: lightColorScheme.secondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildStatusColumn(String title, IconData icon, Color color, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildMultiSelectFormField(
      String title,
      String hint,
      List? dataSource,
      List? initialValue,
      FormFieldValidator validator,
      FormFieldSetter onSaved,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: lightColorScheme.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: MultiSelectFormField(
        autovalidate: AutovalidateMode.disabled,
        chipBackGroundColor: lightColorScheme.primary,
        chipLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 14,
        ),
        dialogTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        checkBoxActiveColor: lightColorScheme.primary,
        checkBoxCheckColor: Colors.white,
        dialogShapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        validator: validator,
        dataSource: dataSource,
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'OK',
        cancelButtonLabel: 'CANCEL',
        hintWidget: Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
          child: Text(hint),
        ),
        initialValue: initialValue,
        onSaved: onSaved,
      ),
    );
  }
}
