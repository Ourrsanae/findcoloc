// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:io' as io;


import 'package:findcoloc/themes/custom_scoffold.dart';
import 'package:findcoloc/themes/theme.dart';
import 'package:findcoloc/view/signup/signup3.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);
  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  io.File? _image;
  final picker = ImagePicker();
  String? selectedcnieliv;
  List listGender = ["male", "female"];
  TextEditingController image = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController textAbout = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();


    Future getImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = io.File(pickedFile.path);
        }
      });
    }

    return SafeArea(
      child: CustomScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 30),
              child: Row(
                children: [

                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Fill Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 28),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: InkWell(
                            onTap: getImage,
                            child: CircleAvatar(
                              backgroundColor:
                              lightColorScheme.shadow.withOpacity(0.3),
                              child: ClipOval(
                                child: SizedBox(
                                  width: 150.0,
                                  height: 150.0,
                                  child: (_image != null)
                                      ? Image.file(
                                    _image!,
                                    fit: BoxFit.fill,
                                  )
                                      : Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Form(
                            key: formState,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                    child: TextFormField(
                                      controller: dateinput,
                                      decoration: InputDecoration(
                                          hintText: "Enter Date",

                                          suffixIcon: Icon(
                                            Icons.calendar_month_rounded,
                                          )),
                                      readOnly:
                                      true, //set it true, so that user will not able to edit text
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(
                                                2000), //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          print(
                                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                          print(
                                              formattedDate); //formatted date output using intl package =>  2021-03-16
                                          //you can implement different kind of Date Format here according to your requirement

                                          setState(() {
                                            dateinput.text =
                                                formattedDate; //set output date to TextField value.
                                          });
                                        } else {
                                          print("Date is not selected");
                                        }
                                      },
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: lightColorScheme.primary,
                                      width: 1.5,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        iconSize: 40,
                                        iconEnabledColor:
                                        lightColorScheme.primary,
                                        iconDisabledColor:
                                        lightColorScheme.shadow,
                                        hint: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Gender'),
                                        ),
                                        value: selectedcnieliv,
                                        items: listGender.map((list) {
                                          return DropdownMenuItem<String>(
                                              value: list,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(9.0),
                                                child: Text(list,
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                    )),
                                              ));
                                        }).toList(),
                                        onChanged: (value) => setState(
                                                () => selectedcnieliv = value!)),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: phone,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 10) {
                                      return "phone number must be 10 digits";
                                    } else {
                                      return null;
                                    }
                                  },
                                  //   focusNode: _focusNodes[0],

                                  decoration: InputDecoration(
                                      hintText: "Your Phone",

                                      suffixIcon: Icon(
                                        Icons.phone,
                                      )),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLines: 3,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 8) {
                                      return "tell us about you";
                                    } else {
                                      return null;
                                    }
                                  },
                                  //   focusNode: _focusNodes[0],
                                  controller: textAbout,
                                  decoration: InputDecoration(
                                      hintText: "A little About You",

                                      suffixIcon: Icon(
                                        Icons.text_fields,
                                      )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignUp3(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: lightColorScheme.secondary,
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                    ),
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                // already have an account
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (e) => const SignUp3(),
                                          ),
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
                            )),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}