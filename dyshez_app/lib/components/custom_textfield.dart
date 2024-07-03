import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String? hintLabel;
  final Color hintLabelColor;
  final Color? iconColor;
  final Widget? suffixIcon;
  final IconData? prefixIcon;

  final bool? isPassword;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  const CustomTextfield(
      {super.key,
      this.hintLabel,
      required this.hintLabelColor,
      this.iconColor,
      this.suffixIcon,
      this.isPassword,
      this.keyboardType,
      required this.controller,
      this.prefixIcon});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 55,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: grayColor, width: 2),
        borderRadius: BorderRadius.circular(108),
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintLabel,
            hintStyle: TextStyle(
              color: widget.hintLabelColor,
            ),
            prefixIcon: Icon(widget.prefixIcon),
            prefixIconColor: grayBoldColor,
            suffixIcon: widget.suffixIcon,
            suffixIconColor: grayBoldColor),
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword!,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
