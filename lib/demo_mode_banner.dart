// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

class DemoModeBanner extends StatelessWidget {
  double fontSize = 22;

  DemoModeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 6;
    } 
    else if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 8;
    }
    return MaterialBanner(
      content:
          Text("Placeholder Banner", style: TextStyle(fontSize: usedFontSize)),
      actions: const [
          SizedBox(),
      ]);
  }
}
