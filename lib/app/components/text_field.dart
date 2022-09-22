import 'package:flutter/material.dart';

Widget newTextField(String text, IconData icons, TextInputType textType,
    TextEditingController controller) {
  return TextField(
    keyboardType: textType,
    controller: controller,
    decoration: InputDecoration(
      border: InputBorder.none,
      //icon: Icon(icons),
      hintText: text,
    ),
  );
}
