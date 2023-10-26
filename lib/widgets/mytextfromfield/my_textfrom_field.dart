import 'package:flutter/material.dart';

import '../../constant/style.dart';

Widget MyTextForm(
    {required TextEditingController controller,
    required String hinttext,
    double border = 20.0,
    double fontsize = 18,
    required double height,
    required double width,
    Color fillcolor = white,
    Color hintcolor = const Color.fromARGB(255, 117, 109, 109),
    Color iconcolor = maincolor,
    bool issecure = false}) {
  return Container(
      width: width,
      height: height,
      child: TextFormField(
        obscureText: issecure,
        cursorColor: white,
        controller: controller,
        textAlign: TextAlign.right,
        validator: (value) {
          if (value!.isEmpty) {
            return "please fill all fields";
          }
          return null;
        },
        decoration: InputDecoration(
            fillColor: fillcolor,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1),
                borderSide: const BorderSide(color: white, width: 2)),
            hintText: hinttext,
            hintStyle: TextStyle(color: hintcolor, fontFamily: 'Cairo'),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1),
                borderSide: BorderSide(color: Colors.white))),
      ));
}
