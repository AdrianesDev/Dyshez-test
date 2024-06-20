import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: grayColor, width: 2),
          borderRadius: BorderRadius.circular(108)),
      child: const TextField(
        decoration: InputDecoration(
            icon: Icon(Icons.alternate_email),
            iconColor: grayBoldColor,
            border: InputBorder.none,
            hintText: "username"),
      ),
    );
  }
}
