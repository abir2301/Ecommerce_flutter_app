import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';

class QitTextField extends StatelessWidget {
  Function(String)? onChanged;
  String? errorText;
  String labelText;
  TextEditingController controller;
  Color color;
  Icon? suffixIcon;
  TextInputType keyboardType;
  Function(String)? onSubmitted;
  bool obscureText;
  bool? enabled;
  QitTextField({
    this.onChanged,
    this.errorText,
    required this.labelText,
    required this.controller,
    this.color = CColors.orange,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
    this.obscureText = false,
    this.enabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              labelText,
              style: const TextStyle(
                color: Color(0xFFBDBDBD),
              ),
            ),
          ),
          Container(
            height: 56,
            decoration: const BoxDecoration(
              color: Color(0xFFf3f3f3),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Center(
              child: TextField(
                // cursorColor: color,
                // style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                controller: controller,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                enabled: enabled,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFBDBDBD),
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFBDBDBD),
                  ),
                  fillColor: const Color(0xFFf3f3f3),
                  // filled: true,
                  //labelText: labelText,
                  iconColor: CColors.green,
                  suffixIcon: suffixIcon,
                  suffixIconColor: color,
                  errorText: errorText,
                  errorStyle:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                keyboardType: keyboardType,
                maxLines: 1,
                obscureText: obscureText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
