import 'package:flutter/material.dart';

Widget newText(String text) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}
