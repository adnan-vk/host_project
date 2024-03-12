import 'package:flutter/material.dart';

class TextWidget {
  text({data, size, weight, color, align, style}) {
    return Text(
      data,
      style: TextStyle(
          fontSize: size, fontWeight: weight, color: color, fontStyle: style),
      textAlign: align,
    );
  }
}
