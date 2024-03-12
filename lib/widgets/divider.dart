// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class divider {
  lineDivider({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          const Flexible(
              child: Divider(
            thickness: 2,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
          const Flexible(
              child: Divider(
            thickness: 2,
          ))
        ],
      ),
    );
  }
}
