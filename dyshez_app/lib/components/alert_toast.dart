import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertToast {
  Color color;
  String message;
  IconData icon;
  AlertToast({required this.color, required this.icon, required this.message});

  void customToast(BuildContext context) {
    FToast fToast = FToast();

    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          color: white.withOpacity(.90),
          border: Border.all(
            color: color.withOpacity(.80),
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color),
            child: Icon(
              icon,
              color: white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(message)),
          GestureDetector(
            onTap: () => fToast.removeCustomToast(),
            child: const Icon(
              Icons.close,
              color: grayBoldColor,
            ),
          )
        ],
      ),
    );
    fToast.showToast(child: toast, toastDuration: const Duration(seconds: 3));
  }
}
