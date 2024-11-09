
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuel_feet/SplashScreen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Network Connectivity/connectivty_check.dart';
import 'Utils/shared_preferences.dart';
import 'color/colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  NetworkConnectivityService();
  await SharedPref.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TanklinePro',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: TankLineColor.primary),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: TankLineColor.blackColor,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
