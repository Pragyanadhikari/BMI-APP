import 'package:flutter/material.dart';

class ScreenSize {
  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;
}
