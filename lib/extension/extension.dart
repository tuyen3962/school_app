import 'package:flutter/material.dart';

extension UiExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;

  double width(double width) {
    // final screenWidth = size.width / 1980;
    return width;
  }

  double height(double height) {
    return height;
  }
}
