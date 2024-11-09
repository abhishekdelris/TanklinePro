// Dart imports:
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fuel_feet/Custom%20Widgets/customText.dart';
import 'package:fuel_feet/Custom%20Widgets/customTextFormField.dart';
import 'package:fuel_feet/Screens/auth/login_step_2.dart';
import 'package:fuel_feet/Screens/auth/verify_otp.dart';
import 'package:fuel_feet/Utils/utils.dart';
import 'package:fuel_feet/color/colors.dart';
import 'package:fuel_feet/constants/constants.dart';
import 'package:fuel_feet/controllers/auth_controllers/login_controller.dart';

// Package imports:
import 'package:get/get.dart';

enum InputType { email, phone, username }

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key, this.canPop = false});
  final bool canPop;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  double h = Constants.screen.height;
  double w = Constants.screen.width;


  InputType identifyInputType(String input) {
    final emailRegex = RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$');
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (emailRegex.hasMatch(input)) {
      return InputType.email;
    } else if (phoneRegex.hasMatch(input)) {
      return InputType.phone;
    } else {
      return InputType.username;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop,
      onPopInvoked: (val) async {
        bool shouldExit =
            await Utils.showConfirmDialog("Exit", 'Do you want to exit?');
        if (shouldExit) {
          exit(0); // Exit the app
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/logo_tanklinepro.png",height: h * 0.2,width: h * 0.2,),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  const CustomText(
                      text: "Welcome\nTo TanklinePro",
                      fontSize: 9,
                      color: TankLineColor.allApp,
                      fontWeight: FontWeight.w500),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  const CustomText(
                      text: "Please enter your username, email, or phone number below.",
                      fontSize: 4.5,
                      color: TankLineColor.blackColor,
                      fontWeight: FontWeight.w400),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  CustomTextFormField(
                    isDense: false,
                    filled: true,
                    fillColor: TankLineColor.whiteTemp,
                    hintText: "phone, email or username",
                    controller: loginController.usernameController,
                    textInputType: TextInputType.text,
                    onSubmitted: (val){
                      InputType inputType = identifyInputType(val);
                      if(inputType == InputType.phone){
                        Get.to(()=> VerifyOtpScreen(mobileNumber: val, otp: '12345'));
                      }else{
                        Get.to(()=>  LoginScreenTwo(userName: val,));
                      }
                    },
                    prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                    ),
                  ),
                  /*SizedBox(
                    height: h * 0.02,
                  ),
                  Center(
                    child: Obx(() {
                      return !loginController.isLoading.value
                          ? CustomButton(
                              height: 55,
                              text: 'Sign In',
                              onPressed: () {
                                // Get.to(() =>  const VerifyOtpScreen(otp: "1234", contactDetail: "1234567890", sendVia: "mobile"));
                                loginController.login();
                              },
                            )
                          : const CircularProgressIndicator();
                    }),
                  ),*/
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
      ),
    );
  }

}
