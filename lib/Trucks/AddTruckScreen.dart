import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Custom Widgets/customButton.dart';
import '../Custom Widgets/customText.dart';
import '../Custom Widgets/customTextFormFieldwithout.dart';
import '../color/colors.dart';
import '../constants/constants.dart';

class AddTruckScreen extends StatefulWidget {
  const AddTruckScreen({super.key});

  @override
  State<AddTruckScreen> createState() => _AddTruckScreenState();
}

class _AddTruckScreenState extends State<AddTruckScreen> {
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
               /* Expanded(
                  child: Center(  // Ensure the text is centered within the expanded space
                    child: CustomText(
                      text: "Add Trucks",
                      fontSize: 5,
                      color: TankLineColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),*/
                Center(  // Ensure the text is centered within the expanded space
                  child: CustomText(
                    text: "Add Trucks",
                    fontSize: 5,
                    color: TankLineColor.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Text("Company Profile"),
                CustomText(
                    text:
                    "Unit Member",
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
                  hintText: "Enter unit",
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
                  height: h * 0.02,
                ),
                CustomText(
                    text:
                    "Plate Number",
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
                  hintText: "Enter plate number",
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
                  height: h * 0.02,
                ),
                CustomText(
                    text:
                    "Make",
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
                  hintText: "Enter make",
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
    );;
  }
}
