// Dart imports:
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fuel_feet/Custom%20Widgets/customButton.dart';
import 'package:fuel_feet/Custom%20Widgets/customText.dart';
import 'package:fuel_feet/Custom%20Widgets/customTextFormField.dart';
import 'package:fuel_feet/Screens/auth/verify_otp.dart';
import 'package:fuel_feet/Utils/utils.dart';
import 'package:fuel_feet/color/colors.dart';
import 'package:fuel_feet/constants/constants.dart';
import 'package:fuel_feet/controllers/auth_controllers/login_controller.dart';

// Package imports:
import 'package:get/get.dart';



class LoginScreenTwo extends StatefulWidget {

  const LoginScreenTwo({super.key, this.canPop = false, required this.userName});
  final bool canPop;
  final String userName;

  @override
  State<LoginScreenTwo> createState() => _LoginScreenTwoState();
}

class _LoginScreenTwoState extends State<LoginScreenTwo> {
  LoginController loginController = Get.find<LoginController>();

  double h = Constants.screen.height;
  double w = Constants.screen.width;

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/logo_tanklinepro.png",height: h * 0.2,width: h * 0.2,),
                SizedBox(
                  height: h * 0.02,
                ),
                const CustomText(
                    text: "Login to\nyour account.",
                    fontSize: 10,
                    color: TankLineColor.allApp,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: h * 0.01,
                ),
                const CustomText(
                    text: "Please sign in to your account",
                    fontSize: 4.0,
                    color: TankLineColor.blackColor,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: h * 0.03,
                ),
                CustomTextFormField(
                  isDense: false,
                  filled: true,
                  fillColor: TankLineColor.whiteTemp,
                  hintText: "email/username",
                  controller: loginController.usernameController,
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  maxLength: 10,
                  prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Obx( () {
                    return CustomTextFormField(
                      isDense: false,
                      filled: true,
                      fillColor: TankLineColor.whiteTemp,
                      hintText: "Password",
                      obscureText: !loginController.passwordVisible.value,
                      controller: loginController.passwordController,
                      textInputType: TextInputType.text,
                      suffixIcon: loginController.passwordVisible.value
                          ? InkWell(
                          onTap: () {
                            loginController.togglePasswordVisibility();
                          },
                          child: const Icon(Icons.visibility,color: TankLineColor.secondary))
                          : InkWell(
                          onTap: () {
                            loginController.togglePasswordVisibility();
                          },
                          child:  const Icon(Icons.visibility_off,color: TankLineColor.secondary,)),
                      maxLength: 10,
                      prefixIcon: const Padding(
                          padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                          child: Icon(Icons.password,color: TankLineColor.secondary,)
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Center(
                  child: Obx(() {
                    return !loginController.isLoading.value
                        ? CustomButton(
                            height: 55,
                            text: 'Sign In',
                            onPressed: () {
                             // loginController.login();
                            },
                          )
                        : const CircularProgressIndicator();
                  }),
                ),
                /*SizedBox(
                  height: h * 0.04,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        fontFamily: Fonts.montserrat,
                        color: TankLineColor.colorFillText,
                        fontSize: Constants.getResponsiveFontSize(4.5),
                        fontWeight: FontWeight.normal,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Register",
                          style: TextStyle(
                            fontFamily: Fonts.roboto, //Fonts.roboto,
                            color: TankLineColor.blackColor,
                            fontSize: Constants.getResponsiveFontSize(4.5),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.to(() => VerifyMobileScreen(
                              //   loginController: loginController,
                              // ));
                            },
                        ),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

}
