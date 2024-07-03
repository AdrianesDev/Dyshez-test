import 'package:dyshez_app/components/custom_button.dart';
import 'package:dyshez_app/components/custom_cuestion_text.dart';
import 'package:dyshez_app/components/custom_textfield.dart';
import 'package:dyshez_app/screens/Login/login_screen.dart';
import 'package:dyshez_app/screens/Verify_OTP/verify_OTP_Screen.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateAnAccountScreen extends StatefulWidget {
  const CreateAnAccountScreen({super.key});

  @override
  State<CreateAnAccountScreen> createState() => _CreateAnAccountScreenState();
}

class _CreateAnAccountScreenState extends State<CreateAnAccountScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;
    final mobileHeight = MediaQuery.of(context).size.height;

    void goToLogin(BuildContext context) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }

    void goToVerifyOTP() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const VerifyOTP()));
    }

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
                const Text(
                  "Verificar email",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: darkBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Enviaremos un código a tu email.",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      color: black),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextfield(
                  controller: emailController,
                  hintLabel: "Email",
                  hintLabelColor: grayBoldColor,
                  isPassword: false,
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  backgroundColor: black,
                  foreground: white,
                  text: "Confirmar",
                  buttonHeight: 56,
                  buttonWidth: mobileWidth,
                  action: () => goToVerifyOTP(),
                ),
                SizedBox(
                  height: mobileHeight * 0.04,
                ),
                CustomCuestionText(
                  label: "¿Ya tienes cuenta?",
                  linkLabel: "Iniciar sesión",
                  labelColor: questionGrayColor,
                  linkLabelColor: pinkLinks,
                  action: () => goToLogin(context),
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
