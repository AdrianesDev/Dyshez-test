import 'package:dyshez_app/components/custom_button.dart';
import 'package:dyshez_app/components/custom_textfield.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerifyNewPassword extends StatefulWidget {
  const VerifyNewPassword({super.key});

  @override
  State<VerifyNewPassword> createState() => _VerifyNewPasswordState();
}

class _VerifyNewPasswordState extends State<VerifyNewPassword> {
  bool hidePassword = true;
  bool hideSecondPassword = true;

  bool isVisible = false;
  bool isVisibleSecondPassword = false;

  TextEditingController getNewPasswordController = TextEditingController();
  TextEditingController verifyNewPasswordController = TextEditingController();

  Widget _showPassword() {
    return IconButton(
      icon: Icon(
        hidePassword ? Icons.visibility_off : Icons.visibility,
        color: hidePassword ? black.withOpacity(.60) : black,
      ),
      onPressed: () {
        setState(() {
          hidePassword = !hidePassword;
        });
      },
    );
  }

  Widget _showSecondPassword() {
    return IconButton(
      icon: Icon(
        hideSecondPassword ? Icons.visibility_off : Icons.visibility,
        color: hideSecondPassword ? black.withOpacity(.60) : black,
      ),
      onPressed: () {
        setState(() {
          hideSecondPassword = !hideSecondPassword;
        });
      },
    );
  }

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
                  "Cambiar Contraseña",
                  style: TextStyle(
                      fontSize: isSmallDevice ? 28 : 32,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: darkBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  controller: getNewPasswordController,
                  hintLabel: "Nueva contraseña",
                  hintLabelColor: grayBoldColor,
                  isPassword: hidePassword,
                  suffixIcon: _showPassword(),
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  controller: verifyNewPasswordController,
                  hintLabel: "Verificar nueva contraseña",
                  hintLabelColor: grayBoldColor,
                  isPassword: hideSecondPassword,
                  suffixIcon: _showSecondPassword(),
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  backgroundColor: black,
                  foreground: white,
                  text: "Cambiar contraseña",
                  buttonHeight: 56,
                  buttonWidth: mobileWidth,
                  hasIconRight: true,
                  icon: Icons.arrow_forward,
                  action: () {},
                ),
                SizedBox(
                  height: mobileHeight * 0.04,
                ),
                Text(
                  "Si no solicitaste la recuperación de tu contraseña, por favor, ignora este mensaje. No es necesario que tomes ninguna acción adicional.",
                  style: TextStyle(
                      fontSize: isSmallDevice ? 14 : 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      color: black),
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
