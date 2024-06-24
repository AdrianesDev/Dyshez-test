import 'package:dyshez_app/components/custom_button.dart';
import 'package:dyshez_app/components/custom_cuestion_text.dart';
import 'package:dyshez_app/components/custom_textfield.dart';
import 'package:dyshez_app/screens/Create_account/create_account_screen.dart';
import 'package:dyshez_app/screens/Login/login_screen.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidePassword = true;
  bool isVisible = false;

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

  void goToCreateAccount(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CreateAnAccountScreen()));
  }

  void goToLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
        backgroundColor: white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: mobileWidth * 0.06),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/svg/logo@2x.svg"),
                  SizedBox(
                    height: isSmallDevice
                        ? mobileHeight * 0.02
                        : mobileHeight * 0.04,
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  const Text(
                    "Crear Cuenta",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: darkBlue),
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  const CustomTextfield(
                    hintLabel: "Username",
                    hintLabelColor: grayBoldColor,
                    isPassword: false,
                    prefixIcon: Icons.alternate_email,
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  const CustomTextfield(
                    hintLabel: "Nombre",
                    hintLabelColor: grayBoldColor,
                    isPassword: false,
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  const CustomTextfield(
                    hintLabel: "Email",
                    hintLabelColor: grayBoldColor,
                    isPassword: false,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  const CustomTextfield(
                    hintLabel: "Telefono",
                    hintLabelColor: grayBoldColor,
                    isPassword: false,
                    prefixIcon: Icons.phone,
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  CustomTextfield(
                    hintLabel: "Contraseña",
                    hintLabelColor: grayBoldColor,
                    isPassword: true,
                    suffixIcon: _showPassword(),
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  CustomTextfield(
                    hintLabel: "Verificar Contraseña",
                    hintLabelColor: grayBoldColor,
                    isPassword: true,
                    suffixIcon: _showPassword(),
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  CustomButton(
                    backgroundColor: black,
                    foreground: white,
                    text: "Crear una cuenta",
                    buttonHeight: 56,
                    buttonWidth: mobileWidth,
                    action: () => goToCreateAccount(context),
                  ),
                  SizedBox(
                    height: isSmallDevice ? 10 : 20,
                  ),
                  CustomCuestionText(
                    label: "¿Ya tienes cuenta?",
                    linkLabel: "Inicia Sesión",
                    labelColor: questionGrayColor,
                    linkLabelColor: pinkLinks,
                    action: () => goToLogin(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
