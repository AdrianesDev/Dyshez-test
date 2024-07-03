import 'package:dyshez_app/components/custom_button.dart';
import 'package:dyshez_app/components/custom_cuestion_text.dart';
import 'package:dyshez_app/components/custom_textfield.dart';
import 'package:dyshez_app/screens/Sign_up/sign_up_screen.dart';
import 'package:dyshez_app/screens/Verify_new_password/verify_new_password.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  void goToSignUp(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  void goToVerifyNewPassword(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const VerifyNewPassword()));
  }

  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;
    final mobileHeight = MediaQuery.of(context).size.height;

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
                  "Recuperar Cuenta",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: darkBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  controller: emailController,
                  hintLabel: "Correo Electronico",
                  hintLabelColor: grayBoldColor,
                  isPassword: false,
                  prefixIcon: Icons.person,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  backgroundColor: black,
                  foreground: white,
                  text: "Restablecer",
                  buttonHeight: 56,
                  buttonWidth: mobileWidth,
                  hasIconRight: true,
                  icon: Icons.arrow_forward,
                  action: () => goToVerifyNewPassword(context),
                ),
                SizedBox(
                  height: mobileHeight * 0.04,
                ),
                CustomCuestionText(
                  label: "¿No tienes cuenta?",
                  linkLabel: "Crea una nueva cuenta",
                  labelColor: questionGrayColor,
                  linkLabelColor: pinkLinks,
                  action: () => goToSignUp(context),
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
