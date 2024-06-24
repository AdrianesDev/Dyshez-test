import 'package:dyshez_app/screens/Order_view/Order_view_screen.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key});

  void goToOrderView(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const OrdenViewScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;
    final bool isSmallDevice = mobileWidth < 400;
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: grayColor))),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              "https://hungrybynature.com/wp-content/uploads/2017/09/pinch-of-yum-workshop-19.jpg",
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () => goToOrderView(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Habibi",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: isSmallDevice ? 16 : 20,
                    fontWeight: FontWeight.w700,
                    color: black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "3 artituclos . ",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: isSmallDevice ? 14 : 17,
                          color: supportGrayColor),
                    ),
                    Text(
                      "\$480.00",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: isSmallDevice ? 14 : 17,
                          color: supportGrayColor),
                    )
                  ],
                ),
                Text(
                  "Dyshez Direct",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: isSmallDevice ? 14 : 17,
                      color: supportGrayColor),
                ),
                Row(
                  children: [
                    Text(
                      "Abr 13 . ",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: isSmallDevice ? 14 : 17,
                          color: supportGrayColor),
                    ),
                    Text(
                      "Completado",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: isSmallDevice ? 14 : 17,
                          color: arrowGrayColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SvgPicture.asset("assets/images/svg/Connect.svg"),
          const Icon(
            Icons.arrow_forward_ios,
            color: arrowGrayColor,
          )
        ],
      ),
    );
  }
}
