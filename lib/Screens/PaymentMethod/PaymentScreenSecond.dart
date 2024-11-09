import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Custom Widgets/customButton.dart';
import '../../Custom Widgets/customText.dart';
import '../../Custom Widgets/customTextFormFieldwithout.dart';
import '../../color/colors.dart';
import '../../constants/constants.dart';
import '../../constants/fonts.dart';

class Paymentscreensecond extends StatefulWidget {
  const Paymentscreensecond({super.key});

  @override
  State<Paymentscreensecond> createState() => _PaymentscreensecondState();
}

class _PaymentscreensecondState extends State<Paymentscreensecond> {
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  int _selectedValue = 1;
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
                    "Card Number",
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
                  hintText: "Enter card number",
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
                    "Name of Card Holder",
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
                  hintText: "Enter holder name",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children at the start

                      children: [
                        CustomText(
                            text:
                            "Ex & date",
                            fontSize: 5,
                            color: TankLineColor.colorOutlineBorder,
                            fontWeight: FontWeight.normal),
                        SizedBox(
                          height: h * 0.01,
                        ),
                       Container(
                         width: 140,
                         child: CustomTextFormFieldWithout(
                            isDense: false,
                            filled: true,
                            fillColor: TankLineColor.whiteTemp,
                            hintText: "08/11/2024",
                            textInputType: TextInputType.text,
                            onSubmitted: (val){

                            },
                          ),
                       ),
                      ],
                    ),
                  ),
                    // SizedBox(
                    //   height: h * 0.04,
                    // ),
                   Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start, // Align children at the start

                       children: [
                         CustomText(
                             text:
                             "VCC",
                             fontSize: 5,
                             color: TankLineColor.colorOutlineBorder,
                             fontWeight: FontWeight.normal),
                         SizedBox(
                           height: h * 0.01,
                         ),
                         Container(
                           width: 140,
                           child: CustomTextFormFieldWithout(
                             isDense: false,
                             filled: true,
                             fillColor: TankLineColor.whiteTemp,
                             hintText: "123",
                             textInputType: TextInputType.text,
                             onSubmitted: (val){

                             },
                           ),
                         ),
                       ],
                     ),
                   )
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                CustomText(
                    text:
                    "Payment Add",
                    fontSize: 5,
                    color: TankLineColor.colorOutlineBorder,
                    fontWeight: FontWeight.normal),
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
                /*  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: TankLineColor.whiteTemp,//Colors.grey[200],
                    // borderRadius: BorderRadius.circular(6.0),
                   *//* border: Border(
                      top: BorderSide(color:TankLineColor.whiteTemp, width: 0.5),
                      bottom: BorderSide(color:  TankLineColor.whiteTemp, width: 0.5),
                    )*//*
                    // border: Border.all(color: Colors.blueAccent, width: 2.0),
                  ),*/
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),

                          CustomText(
                            text: "add menu",
                            fontSize: 4,
                            color: TankLineColor.allApp,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.montserrat,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<int>(
                            value: 2,
                            groupValue: _selectedValue,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),

                          CustomText(
                            text: "user company address",
                            fontSize: 4,
                            color: TankLineColor.allApp,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.montserrat,
                          ),
                        ],
                      ),



                    ],
                  ),
                ),


                SizedBox(
                  height: h * 0.02,
                ),
                CustomText(
                    text:
                    "Address 1",
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
                  hintText: "Enter address 1",
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
                    "Address 2",
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
                  hintText: "Enter address 2",
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  // maxLength: 6,
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
                    "City",
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
                  hintText: "Enter city",
                  textInputType: TextInputType.text,
                  onSubmitted: (val){

                  },
                  // maxLength: 6,
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
                    "Postal",
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
                  hintText: "Enter postal",
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
