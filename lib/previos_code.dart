/// make payment page
/*
import 'package:a2a2_mcsc_app/Controllers/Home%20Controller/home_controller.dart';
import 'package:a2a2_mcsc_app/Custom%20Widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:a2a2_mcsc_app/Custom%20Widgets/customText.dart';
import 'package:a2a2_mcsc_app/color/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Custom Widgets/customTextFormField.dart';
import '../../Utils/utils.dart';
import '../../constants/constants.dart';
import '../../constants/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double large = Constants.largeSize;
  double h = Constants.screen.height;
  double w = Constants.screen.width;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const CustomText(text: "Make Payment", fontSize: 5.5,fontWeight: FontWeight.bold,),
              //     InkWell(
              //       onTap: () async {
              //         bool confirmLogOut = await Utils.showConfirmDialog(
              //             "Log Out", 'Do you want to Log out?');
              //         if (confirmLogOut) {
              //           SharedPref.setLogOut();
              //           Get.to(() => const LoginScreen());
              //         }
              //       },
              //       child: Container(
              //         height: 40,
              //         width: 40,
              //         decoration: BoxDecoration(
              //             color: NatureColor.primary,
              //             borderRadius: BorderRadius.circular(100)
              //         ),
              //         child: const Icon(Icons.logout_rounded,color: NatureColor.whiteTemp,),
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(
                height: large * 0.07,
              ),
              Image.asset("assets/a2a2/a2a2logo.png",height: large * 0.15,width: large * 0.15,),
              SizedBox(
                height: large * 0.03,
              ),
              const CustomText(text: "Make Payment", fontSize: 8,fontWeight: FontWeight.bold,),
              SizedBox(
                height: large * 0.01,
              ),
              CustomTextFormField(
                isDense: false,
                filled: true,
                fillColor: NatureColor.whiteTemp,
                hintText: "Enter Amount",
                controller: homeController.amountController,
                textInputType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0), // Adjust the padding to fit your design
                  child: SvgPicture.asset(
                    'assets/a2a2/ruppes.svg', // Path to your SVG asset
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              SizedBox(
                height: large * 0.02,
              ),
              Center(
                child: CustomButton(
                    height: 55,
                    text: 'Pay Now',
                    onPressed: () async {
                      if(homeController.amountController.text.isEmpty){
                        Utils.mySnackBar(title: 'Enter Amount',msg: 'Please enter amount to pay');
                        return;
                      }
                      final amount = num.tryParse(homeController.amountController.text);
                       if(amount == null || amount <= 0){
                        Utils.mySnackBar(title: 'Invalid Amount',msg: 'Please enter valid amount to pay');
                        return;
                      }
                      final success = await Utils.showOverlayLoader(homeController.addPaymentProcess("1"));
                      // final success = await homeController.addPaymentProcess("1");
                        if(success){
                          showPaymentSuccessBottomSheet();
                        }
                    },
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }

  ///show on payment successfully
  void showPaymentSuccessBottomSheet() {
    Get.bottomSheet(Responsive(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .copyWith(top: 12, bottom: 20),
        decoration: const BoxDecoration(
            color: NatureColor.whiteTemp,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                  color: NatureColor.textLightColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/a2a2/payment_success.png",
                  height: large * 0.25,
                ),
                SizedBox(
                  height: large * 0.03,
                ),
                const CustomText(
                    text: "Payment Payment",
                    fontSize: 7,
                    color: NatureColor.allApp,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: large * 0.01,
                ),
                const CustomText(
                  text:
                  "Payment successfully,",
                  fontSize: 4.1,
                  color: NatureColor.colorOutlineBorder,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: large * 0.03,
                ),
                CustomButton(
                  text: 'Ok',
                  onPressed: () {
                     Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

}

*/