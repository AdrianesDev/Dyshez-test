import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor, foreground;
  final Color? iconColor;
  final String text;
  final BoxBorder? border;
  final double buttonWidth, buttonHeight;
  final bool? hasIcon, hasIconRight, hasBorder, hasImage, hasImageRight;
  final IconData? icon;
  final double? borderRadius;
  final String? image;
  final void Function()? action;

  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.foreground,
    required this.text,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.action,
    this.border,
    this.hasIcon = false,
    this.hasImage = false,
    this.borderRadius = 90,
    this.hasBorder = false,
    this.image,
    this.icon,
    this.hasIconRight = false,
    this.hasImageRight = false,
    this.iconColor = white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
          height: buttonHeight,
          width: buttonWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor,
              border:
                  hasBorder! ? border : Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(borderRadius!)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                  visible: hasIcon! || hasImage!,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: hasImage!
                        ? Image.asset(
                            "assets/images/$image",
                            width: 33,
                            height: 33,
                          )
                        : Icon(
                            icon,
                            size: 33,
                          ),
                  )),
              Text(
                text,
                style: TextStyle(
                  color: foreground,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Visibility(
                  visible: hasIconRight! || hasImageRight!,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: hasImageRight!
                        ? Image.asset(
                            "assets/images/$image",
                            width: 33,
                            height: 33,
                          )
                        : Icon(
                            icon,
                            size: 33,
                            color: iconColor,
                          ),
                  )),
            ],
          )),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final void Function() action;
  const CustomBackButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
          onPressed: () => action(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: black,
              minimumSize: const Size(40, 40)),
          child: const Icon(
            Icons.arrow_back,
            color: white,
          )),
    );
  }
}
