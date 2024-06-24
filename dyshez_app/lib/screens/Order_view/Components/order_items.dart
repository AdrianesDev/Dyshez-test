import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;
    return Container(
      width: mobileWidth,
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: grayColor, width: 2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: pink.withOpacity(0.1)),
                child: const Text(
                  "x2",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17,
                      color: pink,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Pizza italina",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: black,
                ),
              )
            ],
          ),
          const Row(
            children: [
              Text(
                "\$320",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: grayBoldColor,
                    decoration: TextDecoration.lineThrough),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "\$240",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
