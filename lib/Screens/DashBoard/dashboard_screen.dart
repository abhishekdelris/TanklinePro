

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_feet/Custom%20Widgets/customText.dart';
import 'package:fuel_feet/color/colors.dart';

import '../../Custom Widgets/customButton.dart';
import 'drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}
String selectedEquipment = 'equipment1';
class _DashboardScreenState extends State<DashboardScreen> {

  List<Map<String, String>> products = [
    {
      'name': 'Product 1'
    },
    {
      'name': 'Product 2',

    },
    {
      'name': 'Product 3',

    },
    {
      'name': 'Product 4',

    },
  ];
  int? selectedIndex; // To track the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(),*/
      appBar: AppBar(
        // title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Add action for settings button
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Add action for profile button
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body:  Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Dropdown with improved design
    Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
    color: TankLineColor.whiteTemp,//Colors.grey[200],
    borderRadius: BorderRadius.circular(10),
    ),
    child: DropdownButton<String>(
    isExpanded: true,
    underline: SizedBox(),
    style: const TextStyle(fontSize: 14, color: Colors.black),
    value: selectedEquipment,
    items: [
    DropdownMenuItem(
    value: "equipment1",
    child: CustomText(text: "Equipment 1", fontSize: 6),
    ),
    DropdownMenuItem(
    value: "equipment2",
    child: CustomText(text: "Equipment 2", fontSize: 6),
    ),
    DropdownMenuItem(
    value: "equipment3",
    child: CustomText(text: "Equipment 3", fontSize: 6),
    ),
    ],
    onChanged: (val) {
    setState(() {
    selectedEquipment = val!;
    });
    },
    ),
    ),
    const SizedBox(height: 20),

    // Product list in card view
    Container(
      // width: 150, // Adjust width as needed
      height: 80,
    child: ListView.builder(

      scrollDirection: Axis.horizontal, // Set to horizontal
    itemCount: products.length,
    itemBuilder: (context, index) {
    final product = products[index];
    return Container(
      width: 150, // Adjust width as needed
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector( // or InkWell can be used here
        onTap: () {
          setState(() {
            selectedIndex = index; // Set the selected index when tapped
          });
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
            //.blueAccent
          color: selectedIndex == index ? TankLineColor.primary : Colors.white, // Change color when selected
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product['name']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == index ? Colors.white : Colors.black, // Change text color when selected
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    },
    ),
    ),
      const SizedBox(height: 20),

      Spacer(),
      CustomButton(
        height: 55,
        text: 'Authorize Pumping',
        onPressed: () {
          // loginController.login();
        },
      ),
      const SizedBox(height: 10),
    ],
    )),
    );
  }
}
