import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCuestionText extends StatelessWidget {
  final String label, linkLabel;
  final Color labelColor, linkLabelColor;
  final VoidCallback action;

  const CustomCuestionText({
    super.key,
    required this.label,
    required this.linkLabel,
    required this.labelColor,
    required this.linkLabelColor,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;
    final bool isSmallDevice = mobileWidth < 400;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: isSmallDevice ? 13 : 15,
              fontFamily: "Poppins",
              fontWeight: FontWeight.normal,
              color: questionGrayColor,
            )),
        SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: action,
          child: Text(
            linkLabel,
            style: TextStyle(
              fontSize: isSmallDevice ? 13 : 15,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: linkLabelColor,
            ),
          ),
        )
      ],
    );
  }
}
