import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Widget buildFeature(String title, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextWidget().text(
          data: title,
          size: 18.0,
          weight: FontWeight.bold,
          color: appcolor.blue),
      const SizedBox(height: 5.0),
      TextWidget().text(
        data: description,
        size: 16.0,
      ),
      const SizedBox(height: 10.0),
    ],
  );
}
