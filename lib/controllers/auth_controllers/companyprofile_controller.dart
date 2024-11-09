import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Api Services/api_helper_methods.dart';
import '../../Api Services/api_services.dart';
import '../../Utils/utils.dart';

class CompanyProfileController extends GetxController {
  RxBool passwordVisible = false.obs;
  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;

  ///api services instances
  ApiServices apiServices = ApiServices();
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();


  ///api urls
  String get loginUrl => apiServices.login;
  String get verifyNewUrl => apiServices.verifyNewUser;
  String get verifyOtpUrl =>apiServices.verifyOtp;
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final verifyMobileController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPassMobileController = TextEditingController();



  ///handle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  /// login method on submit
  Future<dynamic> login() async {
    if (usernameController.text.isEmpty) {
      Utils.mySnackBar(
          title: "Username  Not Found",
          msg: 'Please Enter Username',
          maxWidth: 300);
    } else if (passwordController.text.isEmpty) {
      Utils.mySnackBar(
          title: "Password Not Found",
          msg: 'Please Enter Password',
          maxWidth: 300);
    } else {
      getLogin();
    }
  }

  ///  api request for login
  getLogin() async {

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    // final response = await apiBaseHelper.postAPICall(Uri.parse(loginUrl), {
    //   "mobile": usernameController.text,
    //   "password": passwordController.text,
    // });
    //   log("value --> $response");
    //   isLoading.value = false;
    //   if ((response["status"]??false)  == false) {
    //     Utils.mySnackBar(
    //         title: "Error Found",
    //         msg: response["message"] ?? "Something went wrong please try again");
    //   } else {
    //     SharedPref.setLoginAndUserId(response['data']['id']);
    //     Utils.mySnackBar(
    //         title: "Success",
    //         msg: 'logged in successfully!');
    //     // Get.offAll(() => const DashboardScreen(
    //     //      selectedIndex: 0,
    //     //     ));
    //     Get.delete<LoginController>();
    //   }
  }

  ///  api request for verify mobile
  Future<bool> verifyRegisterMobile({bool resend = false}) async {
    if (verifyMobileController.text.isEmpty) {
      Utils.mySnackBar(
          title: "Mobile number not found",
          msg: "Please enter mobile number to verify");
      return false;
    }
    Utils.showLoader();
    try {
      final response = await apiBaseHelper.postAPICall(Uri.parse(verifyNewUrl), {
        "mobile":verifyMobileController.text,
      });
      Get.back();
      if (!(response["status"] ?? false)) {
        Utils.mySnackBar(
            title: "Error Found",
            msg: response["message"] ?? "Something went wrong please try again");
        return false;
      } else {
        var otp = response['otp'];
        if(!resend){
        }
        return true;
      }
    } on Exception catch (e) {
      Utils.mySnackBar(
          title: "Error Found",
          msg: e.toString());
      return false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  ///  api request for forgot mobile

/*  Future<String?> verifyForgotMobile({bool resend =  false}) async {
    if (forgetPassMobileController.text.isEmpty) {
      Utils.mySnackBar(
          title: "Mobile number not found",
          msg: "Please enter mobile number to verify");
      return '';
    }
    Utils.showLoader();
    try {
      final response = await apiBaseHelper.postAPICall(Uri.parse(forgotPassword), {
        "mobile": forgetPassMobileController.text,
      });
        Get.back();
        if (response["status"] ?? true) {
          Utils.mySnackBar(
              title: "Error Found",
              msg: response["message"] ?? "Something went wrong please try again");
        } else {
          var otp = response['data'];
          //return otp;
          if(!resend){

        }
      }
    } on Exception catch (e) {
      Get.back();
    }
  }*/

  ///  api request for verify otp
  verifyOtp(String otp,) async {

    Utils.showLoader();
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
   // Get.offAll(() => const DashboardScreen());
    // Utils.showLoader();
    // try {
    //   final response = await apiBaseHelper.postAPICall(Uri.parse(verifyOtpUrl), {
    //     "mobile": verifyMobileController.text,
    //     "otp":otp,
    //   });
    //   Get.back();
    //     if (response["status"] == false) {
    //       Utils.mySnackBar(
    //           title: "Error Found",
    //           msg: response["message"] ?? "Something went wrong please try again");
    //     } else {
    //       Get.close(2);
    //     }
    // } on Exception catch (e) {
    //   Get.back();
    //   Utils.mySnackBar(
    //       title: "Error Found",
    //       msg: e.toString());
    // }
  }

  //Forget Pass word handling
  /// handle verify email and send confirmation code method and get back to the login screen
  Future<bool> verifyMobileAndSendCode({bool forget = false}) async {
    if (forget && forgetPassMobileController.text.isEmpty) {
      Utils.mySnackBar(
          title: "Mobile Not Found",
          msg: 'Please Enter mobile no.',
          maxWidth: 200);
      return false;
    } else if (!forget && verifyMobileController.text.isEmpty) {
      Utils.mySnackBar(
          title: "Mobile Not Found",
          msg: 'Please Enter mobile no.',
          maxWidth: 200);
      return false;
    } else {
      isLoading.value = true;
      // await apiRequests.userLogin(
      //   mobileController.text,
      //   passwordController.text,
      //   audioController,
      // );
      Get.back();
      isLoading.value = false;
      return true;
    }
  }
}