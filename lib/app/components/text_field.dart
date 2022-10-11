import 'package:flutter/material.dart';

Widget newTextFormField(String text, IconData icons, TextInputType textType,
    TextEditingController controller) {
  return TextFormField(
    keyboardType: textType,
    controller: controller,
    decoration: InputDecoration(
      border: InputBorder.none,
      //icon: Icon(icons),
      hintText: text,
    ),
  );
}
