// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class textFormField {
  textformfield(
      {controller,
      labeltext,
      onchange,
      validator,
      String? type,
      keytype,
      max,
      minline,
      bool obsc = false}) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $labeltext";
        } else if (type == "Email") {
          if (!EmailValidator.validate(value)) {
            return "Please enter a valid email address";
          }
        } else if (type == 'Password') {
          if (value.length < 6) {
            return 'Password should be at least 6 characters';
          }
        } else if (type == 'Confirm Password') {
          if (value != controller) {
            return 'Passwords do not match';
          }
        } else if (type == 'OTP') {
          if (value.length != 6) {
            return "OTP must contains 6 characters";
          }
        } else if (type == 'phone') {
          if (value.length != 13) {
            return "Please Enter Valid Phone Number";
          }
        }
        return null;
      },
      obscureText: obsc,
      minLines: minline,
      maxLength: max,
      keyboardType: keytype,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: labeltext,
      ),
      onChanged: (value) {
        onchange;
      },
    );
  }
}
