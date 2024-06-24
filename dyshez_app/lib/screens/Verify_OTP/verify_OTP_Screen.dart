import 'package:dyshez_app/components/OTP_button.dart';
import 'package:dyshez_app/components/custom_cuestion_text.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;
    final mobileHeight = MediaQuery.of(context).size.height;
    final bool isSmallDevice = mobileWidth < 400;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: mobileWidth * 0.06),
            alignment: Alignment.center,
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset("assets/images/svg/logo@2x.svg"),
                SizedBox(
                  height: mobileHeight * 0.04,
                ),
                Text(
                  "Te hemos enviado un código de verificación",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: isSmallDevice ? 28 : 32,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: darkBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Hemos enviado un codigo de verificación a tu email, por favor verifícalo e ingresalo.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: isSmallDevice ? 16 : 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      color: black),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OTPButton(),
                    OTPButton(),
                    OTPButton(),
                    OTPButton(),
                    OTPButton(),
                    OTPButton(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "¿No te ha llegado ningún código de verificación?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: isSmallDevice ? 16 : 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      color: black),
                ),
                SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Solicitar nuevamente ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: isSmallDevice ? 16 : 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.normal,
                        color: supportGrayColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.schedule,
                      color: questionGrayColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "56 seg",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: isSmallDevice ? 16 : 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          color: questionGrayColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 92,
                  decoration: BoxDecoration(
                      border: Border.all(color: grayColor, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.support,
                        color: darkBlue,
                        size: 24,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomCuestionText(
                        label: "¿Necesitas más ayuda?",
                        linkLabel: "Contacta a soporte",
                        labelColor: questionGrayColor,
                        linkLabelColor: pinkLinks,
                        action: () {},
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
