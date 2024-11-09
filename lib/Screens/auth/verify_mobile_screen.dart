// Flutter imports:
import 'package:flutter/material.dart';
import 'package:fuel_feet/Custom%20Widgets/customButton.dart';
import 'package:fuel_feet/Custom%20Widgets/customText.dart';
import 'package:fuel_feet/Custom%20Widgets/customTextFormField.dart';
import 'package:fuel_feet/color/colors.dart';
import 'package:fuel_feet/constants/constants.dart';
import 'package:fuel_feet/controllers/auth_controllers/login_controller.dart';
// Package imports:
import 'package:get/get.dart';

// Project imports:

class VerifyMobileScreen extends StatefulWidget {
  final LoginController loginController;

  const VerifyMobileScreen({super.key, required this.loginController});

  @override
  State<VerifyMobileScreen> createState() => _VerifyMobileScreenState();
}

class _VerifyMobileScreenState extends State<VerifyMobileScreen> {
 
  double h = Constants.screen.height;
  double w = Constants.screen.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: h,
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/a2a2/back_image.jpg'),
              fit: BoxFit.fill
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/a2a2/a2a2logo.png",height: h * 0.15,width: h * 0.15,),
                SizedBox(
                  height: h * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                        text: "Please enter\nyour mobile no.",
                        fontSize: 10,
                        color: TankLineColor.allApp,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    const CustomText(
                        text:
                            "Look for a field where you need to enter\nyour mobile number. Enter your number carefully,",
                        fontSize: 4.5,
                        color: TankLineColor.colorOutlineBorder,
                        fontWeight: FontWeight.normal),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    /*const CustomText(
                      text: "Enter Mobile Number",
                      fontSize: 4,
                      color: NatureColor.allApp,
            
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: large * 0.01,
                    ),*/
                    CustomTextFormField(
                      maxLength: 10,
                      isDense: false,
                      filled: true,
                      fillColor: TankLineColor.whiteTemp,
                      hintText: "Enter Mobile Number",
                      textInputType: TextInputType.number,
                      controller: widget.loginController.verifyMobileController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0), // Adjust the padding to fit your design
                        child: Image.asset(
                          'assets/a2a2/Contact Us.svg', // Path to your SVG asset
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Center(
                  child: CustomButton(
                    height: h*0.06,
                    text: 'Send OTP',
                    onPressed: () {
                      widget.loginController.verifyRegisterMobile();
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }



  ///dispose method when screen is disposed
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.loginController.forgetPassMobileController.clear();
  }
}

///custom box for contact details
class ContactDetailBox extends StatelessWidget {
  final String textSendVia;
  final String contactDetail;
  final String contactIconImage;
  final bool isSelected;

  const ContactDetailBox(
      {super.key,
      required this.textSendVia,
      required this.contactDetail,
      required this.contactIconImage,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 2,
              color: isSelected
                  ? TankLineColor.secondary
                  : TankLineColor.textLightColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            contactIconImage,
            height: Constants.largeSize * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Send via $textSendVia",
                fontSize: 4,
                color: TankLineColor.textLightColor,
              ),
              SizedBox(
                height: Constants.largeSize * 0.01,
              ),
              SizedBox(
                width: Constants.screen.width * 0.52,
                child: Flexible(
                  child: CustomText(
                    text: contactDetail,
                    fontSize: 4,
                    color: TankLineColor.blackColor,
                    overFlow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          isSelected
              ? Image.asset(
                  "assets/icons/right_icon.png",
                  height: Constants.largeSize * 0.05,
                )
              : SizedBox(
                  width: Constants.largeSize * 0.05,
                ),
        ],
      ),
    );
  }
}
