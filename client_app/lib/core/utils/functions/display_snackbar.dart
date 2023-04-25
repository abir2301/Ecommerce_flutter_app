import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';

void displaySnackbar(BuildContext context, String txt) {
  final snackBar = SnackBar(
      duration: Duration(milliseconds: 1000),
      backgroundColor: CColors.black,
      content: Text(txt));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
