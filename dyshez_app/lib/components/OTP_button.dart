import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPButton extends StatefulWidget {
  const OTPButton({super.key});

  @override
  State<OTPButton> createState() => _OTPButtonState();
}

class _OTPButtonState extends State<OTPButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: grayBoldColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
