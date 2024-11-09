import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fuel_feet/Utils/utils.dart';
import 'package:fuel_feet/controllers/auth_controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../Custom Widgets/customButton.dart';
import '../../../Custom Widgets/customText.dart';
import '../../../color/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/responsive.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String mobileNumber;
  final String otp;
  const VerifyOtpScreen({super.key, required this.mobileNumber,required this.otp});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen>{

  double h = Constants.screen.height;
  double w = Constants.screen.width;
  LoginController loginController = Get.find<LoginController>();

  String? otpCode;
  // String? appSignature;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // SmsAutoFill().getAppSignature.then((signature) {
    //   setState(() {
    //     appSignature = signature;
    //     log('app signature  $appSignature');
    //   });
    // });
    startContDown();
  }

  // int minutes = 0;
  ValueNotifier<int> seconds = ValueNotifier(0);

  ///resend code count down
  void startContDown({bool resend = false}) {
    // minutes = 1;
    seconds.value = 59;
    if(resend){
      setState(() {});
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (/*minutes == 0 &&*/ seconds.value == 0) {
        timer.cancel();
        setState(() {});
      }
      /*else if (seconds.value == 0) {
        minutes--;
        seconds.value = 59;
      } */
      else {
        seconds.value--;
      }
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Responsive(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/logo_tanklinepro.png",height: h * 0.2,width: h * 0.2,),
                      /*SizedBox(
                        height: h * 0.01,
                      ),*/
                      CustomText(
                          text:
                              "Enter the verification code we sent you on ${widget.mobileNumber}",
                          fontSize: 5,
                          color: TankLineColor.colorOutlineBorder,
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      CustomText(
                          text:
                          "OTP : ${widget.otp}",
                          fontSize: 5,
                          color: TankLineColor.colorOutlineBorder,
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      PinFieldAutoFill(
                        codeLength: widget.otp.length,
                        autoFocus: true,
                        cursor: Cursor(
                            color: TankLineColor.primary,
                          width: 2,
                          height: 20,
                          enabled: true
                        ),
                        decoration:

                        UnderlineDecoration(
                          lineHeight: 0,
                          gapSpace: 100/(widget.otp.length + 2),
                          lineStrokeCap: StrokeCap.square,
                          bgColorBuilder: PinListenColorBuilder(
                              TankLineColor.secondary,
                              TankLineColor.secondary.withOpacity(0.4)),
                          colorBuilder:
                              const FixedColorBuilder(Colors.transparent),
                        ),

                        onCodeSubmitted: (code) {
                          otpCode = code;
                          log("OTP Submitted: $code");
                        },
                        onCodeChanged: (code) {
                          if (code?.length == widget.otp.length) {
                            otpCode = code;
                            log("Complete OTP: $code");
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: seconds.value == 0 /* && minutes == 0*/
                                ? "Didn't receive code? "
                                : 'Resend code after : ',
                            fontSize: 4.5,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          ValueListenableBuilder(
                              valueListenable: seconds,
                              builder: (_, second, child) {
                                String timerText =
                                    /*${minutes.toString().padLeft(2, '0')}*/'00:${second.toString().padLeft(2, '0')}';
                                return InkWell(
                                  onTap: () async {
                                    if (second != 0) return;
                                    await loginController.verifyRegisterMobile(
                                        resend: true);
                                    startContDown(resend: true);
                                  },
                                  child: CustomText(
                                    text: second == 0 /*&& minutes == 0*/
                                        ? 'Resend'
                                        : timerText,
                                    fontSize: 4.6,
                                    color: TankLineColor.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              })
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Center(
                    child: CustomButton(
                      height: 55,
                      text: 'Verify',
                      onPressed: () {
                        if ((otpCode ?? '').isEmpty || (otpCode ?? '').length != widget.otp.length) {
                          Utils.mySnackBar(
                              title: "Otp not found", msg: "Please enter otp to verify");
                          return;
                        }else if(otpCode != widget.otp){
                          Utils.mySnackBar(
                              title: "Wrong Otp", msg: "Please enter correct otp");
                          return;
                        }
                        loginController.verifyOtp(otpCode ?? '');
                      },
                    ),
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
