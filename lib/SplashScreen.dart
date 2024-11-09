import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fuel_feet/Screens/DashBoard/dashboard_screen.dart';
import 'package:fuel_feet/Screens/auth/login_screen.dart';
import 'package:fuel_feet/Utils/shared_preferences.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  String? userId;
  @override
  void initState() {
    super.initState();
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        getSessionManage();
     }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child:  const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/logo_tanklinepro.png'), // Replace with your image path
            ),
          ),
        ),
      ),
    );
  }
  goToStartScreen() {

    if (userId == "") {

    } else {
      // bool loggedIn = SharedPref.getLogin();
      // if (!loggedIn) {
      //   Get.to(() => const LoginScreen());
      // } else {

      // }
    }
  }
  getSessionManage() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    String userId = SharedPref.getUserId();
    if(userId.isEmpty){
       Get.offAll(() => const DashboardScreen());
       }else{
      Get.offAll(() => const DashboardScreen());
     }
  }
}

