import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_feet/Custom%20Widgets/customTextFormFieldwithout.dart';

import '../../Custom Widgets/customButton.dart';
import '../../Custom Widgets/customText.dart';
import '../../color/colors.dart';
import '../../constants/constants.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {

  double h = Constants.screen.height;
  double w = Constants.screen.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/logo_tanklinepro.png",height: h * 0.2,width: h * 0.2,),
                SizedBox(
                  height: h * 0.03,
                ),
                /* CustomText(
                    text: "Welcome\nTo TanklinePro",
                    fontSize: 9,
                    color: TankLineColor.allApp,
                    fontWeight: FontWeight.w500),*/
                SizedBox(
                  height: h * 0.01,
                ),
                 CustomText(
                    text: "Phone",
                    fontSize: 4.5,
                    color: TankLineColor.blackColor,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: h * 0.01,
                ),
                CustomTextFormFieldWithout(
                  isDense: false,
                  filled: true,
                  fillColor: TankLineColor.whiteTemp,
                  hintText: "enter invitation",
                 // controller: loginController.usernameController,
                  textInputType: TextInputType.text,
                  onSubmitted: (val){
                /*    InputType inputType = identifyInputType(val);
                    if(inputType == InputType.phone){
                      Get.to(()=> VerifyOtpScreen(mobileNumber: val, otp: '12345'));
                    }else{
                      Get.to(()=>  LoginScreenTwo(userName: val,));
                    }*/
                  },
                  prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                  ),
                ),
                SizedBox(
                    height: h * 0.02,
                  ),
                  Center(
                    child: /*Obx(() {
                      return !loginController.isLoading.value
                          ?*/ CustomButton(
                              height: 55,
                              text: 'Send Invitation',
                              onPressed: () {
                                // Get.to(() =>  const VerifyOtpScreen(otp: "1234", contactDetail: "1234567890", sendVia: "mobile"));
                               // loginController.login();
                              },
                            ),
                         // : const CircularProgressIndicator();
                   // }
                    ),
                  //),
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
