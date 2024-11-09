import 'package:flutter/material.dart';
import 'package:fuel_feet/constants/constants.dart';
import 'package:fuel_feet/controllers/auth_controllers/companyprofile_controller.dart';
import 'package:get/get.dart';
import '../Custom Widgets/customButton.dart';
import '../Custom Widgets/customText.dart';
import '../Custom Widgets/customTextFormField.dart';
import '../Custom Widgets/customTextFormFieldwithout.dart';
import '../color/colors.dart';
class CompanyProfile extends StatefulWidget {

  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  // CompanyProfileController companyProfileController = Get.find<CompanyProfileController>();

  double h = Constants.screen.height;
  double w = Constants.screen.width;

  @override
  void dispose() {
    // companyProfileController.dispose();
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
                SizedBox(
                  height: h * 0.05,
                ),

                //Text("Company Profile"),
                CustomText(
                    text:
                    "Company Name",
                    fontSize: 5,
                    color: TankLineColor.colorOutlineBorder,
                    fontWeight: FontWeight.normal),
                SizedBox(
                  height: h * 0.01,
                ),
                CustomTextFormFieldWithout(
                  isDense: false,
                  filled: true,
                  fillColor: TankLineColor.whiteTemp,
                  hintText: "Company Name",
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  // maxLength: 10,
                  /* prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                  ),*/
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                CustomTextFormFieldWithout(
                  isDense: false,
                  filled: true,
                  fillColor: TankLineColor.whiteTemp,
                  hintText: "Address 1",
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  // maxLength: 10,
                 /* prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                  ),*/
                ),
                SizedBox(
                  height: h * 0.04,
                ),

                CustomTextFormFieldWithout(
                  isDense: false,
                  filled: true,
                  fillColor: TankLineColor.whiteTemp,
                  hintText: "Address 2",
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  // maxLength: 10,
                  /* prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                  ),*/
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                CustomTextFormFieldWithout(
                  isDense: false,
                  filled: true,
                  fillColor: TankLineColor.whiteTemp,
                  hintText: "City",
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  // maxLength: 10,
                  /* prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                  ),*/
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                CustomTextFormFieldWithout(
                  isDense: false,
                  filled: true,
                  fillColor: TankLineColor.whiteTemp,
                  hintText: "/State",
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  // maxLength: 10,
                  /* prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                  ),*/
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                CustomTextFormFieldWithout(
                  isDense: false,
                  filled: true,
                  fillColor: TankLineColor.whiteTemp,
                  hintText: "Postal Code",
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  maxLength: 6,
                  /* prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12.0), // Adjust the padding to fit your design
                      child: Icon(Icons.person,color: TankLineColor.secondary,)
                  ),*/
                ),
                SizedBox(
                  height: h * 0.08,
                ),

                 Center(
                  child: //Obx(() {
                   // return// !companyontroller.isLoading.value
                       // ?
                    CustomButton(
                      height: 55,
                      text: 'Save',
                      onPressed: () {
                        // loginController.login();
                      },
                    )
                       // : const CircularProgressIndicator();
                  //}),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
