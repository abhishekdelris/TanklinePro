import 'package:flutter/material.dart';
import 'package:fuel_feet/Screens/PaymentMethod/paymentScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../CompanyProfile/company_profile.dart';
import '../../DeliveryTicket/deliveryticketscreen.dart';
import '../../Trucks/TrucksProfileScreen.dart';
import '../../color/colors.dart';
import '../User Profile/UserScreen.dart';
import 'DrawerItem.dart';
import 'dashboard_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: TankLineColor.primary,
            ),
            child: Center(
              child: Text(
                "My App Drawer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          DrawerItem(icon: Icons.person, text: "Company Profile",  onTap: () {
            Get.to(()=>  CompanyProfile()/*Get.to(CompanyProfile()*/); // Use Get.to for navigation
          },),
          DrawerItem(icon: Icons.fire_truck, text: "Trucks", onTap: () {
            Get.to(Trucksprofilescreen()); // Use Get.to for navigation
          },),
          DrawerItem(icon: Icons.person, text: "Users", onTap: () {
            Get.to(Usersscreen()); // Use Get.to for navigation
          },),
          DrawerItem(icon: Icons.payment, text: "Payment Method", onTap: () {
            Get.to(Paymentscreen()); // Use Get.to for navigation
          },),
          DrawerItem(icon: Icons.delivery_dining, text: "Deliveries", onTap: () {
            Get.to(Deliveryticketscreen()); // Use Get.to for navigation
          },),
        ],
      ),
    );
  }
}
