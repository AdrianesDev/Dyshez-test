import 'package:dyshez_app/components/custom_button.dart';
import 'package:dyshez_app/components/custom_cuestion_text.dart';
import 'package:dyshez_app/components/custom_textfield.dart';
import 'package:dyshez_app/screens/Quick_menu/order_history_screen.dart';
import 'package:dyshez_app/screens/Reset_password/reset_password_screen.dart';
import 'package:dyshez_app/screens/Sign_up/sign_up_screen.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  bool isVisible = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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

  void goToSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  void goToOrderHistory() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const OrderHistory()));
  }

  void goToResetPassword() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ResetPassword()));
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset("assets/images/svg/logo@2x.svg"),
                SizedBox(
                  height: mobileHeight * 0.04,
                ),
                const Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: darkBlue),
                ),
                SizedBox(
                  height: mobileHeight * 0.04,
                ),
                const CustomTextfield(
                  hintLabel: "Username",
                  hintLabelColor: grayBoldColor,
                  isPassword: false,
                  prefixIcon: Icons.alternate_email,
                ),
                SizedBox(
                  height: mobileHeight * 0.02,
                ),
                CustomTextfield(
                  hintLabel: "Password",
                  hintLabelColor: grayBoldColor,
                  isPassword: hidePassword,
                  suffixIcon: _showPassword(),
                  prefixIcon: Icons.lock_outline,
                ),
                SizedBox(
                  height: mobileHeight * 0.02,
                ),
                CustomButton(
                  backgroundColor: pink,
                  foreground: white,
                  text: "Iniciar Sesión",
                  buttonHeight: 56,
                  buttonWidth: mobileWidth,
                  action: () => goToOrderHistory(),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomCuestionText(
                  label: "¿No tienes cuenta?",
                  linkLabel: "Crea una nueva cuenta",
                  labelColor: questionGrayColor,
                  linkLabelColor: pinkLinks,
                  action: () => goToSignUp(),
                ),
                const SizedBox(
                  height: 4,
                ),
                ColoredBox(
                  color: grayColor,
                  child: SizedBox(
                    height: 1,
                    width: mobileWidth * 0.85,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomCuestionText(
                  label: "¿Olvidaste tu contraseña?",
                  linkLabel: "Recupera tu cuenta",
                  labelColor: questionGrayColor,
                  linkLabelColor: pinkLinks,
                  action: () => goToResetPassword(),
                ),
                SizedBox(
                  height: mobileHeight * 0.02,
                ),
                const Spacer(),
                CustomButton(
                  backgroundColor: white,
                  foreground: black,
                  text: "Iniciar sesión con Apple ID",
                  buttonHeight: 52,
                  buttonWidth: mobileWidth,
                  action: () {},
                  hasBorder: true,
                  border: Border.all(color: grayColor, width: 2),
                  hasImage: true,
                  image: "png/apple-logo.png",
                ),
                SizedBox(
                  height: mobileHeight * 0.02,
                ),
                CustomButton(
                  backgroundColor: white,
                  foreground: black,
                  text: "Iniciar sesión con google",
                  buttonHeight: 52,
                  buttonWidth: mobileWidth,
                  action: () {},
                  hasBorder: true,
                  border: Border.all(color: grayColor, width: 2),
                  hasImage: true,
                  image: "png/google-logo.png",
                ),
                SizedBox(
                  height: mobileHeight * 0.02,
                ),
                CustomButton(
                  backgroundColor: white,
                  foreground: black,
                  text: "Iniciar sesión con Facebook",
                  buttonHeight: 52,
                  buttonWidth: mobileWidth,
                  action: () {},
                  hasBorder: true,
                  border: Border.all(color: grayColor, width: 2),
                  hasImage: true,
                  image: "png/facebook-logo.png",
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
