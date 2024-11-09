import 'package:flutter/material.dart';
import 'package:fuel_feet/Screens/User%20Profile/InviteScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Custom Widgets/customText.dart';
import '../../color/colors.dart';
import '../../constants/constants.dart';

class Usersscreen extends StatefulWidget {
  const Usersscreen({super.key});

  @override
  State<Usersscreen> createState() => _UsersscreenState();
}

class _UsersscreenState extends State<Usersscreen> {
  double h = Constants.screen.height;
  double w = Constants.screen.width;


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
  bool switchValue = false; // Initial value of the switch

  @override
  void dispose() {
    // companyProfileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  *//* appBar: AppBar(),*//*
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
      drawer: MyDrawer(),*/
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.03,
                ),

                //Text("Company Profile"),
                Row(
                  children: [
                    // Expanded widget to take up available space and center the text
                    Expanded(
                      child: Center(  // Ensure the text is centered within the expanded space
                        child: CustomText(
                          text: "Users",
                          fontSize: 5,
                          color: TankLineColor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Add Icon Button on the right side
                    // Invite text button on the right side
                    TextButton(
                      onPressed: () {
                        Get.to(InviteScreen());
                        // Handle Invite action
                      },
                      child: Text(
                        "Invite",
                        style: TextStyle(
                          color: TankLineColor.whiteTemp, // Set text color for the Invite button
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Adjust padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Optional: for rounded corners
                        ),
                        backgroundColor: TankLineColor.primary, // Set background color if needed
                      ),
                    ),
                  ],
                ),
                /*   CustomText(

                    text:
                    "Trucks",
                    fontSize: 5,
                    color: TankLineColor.colorOutlineBorder,
                    fontWeight: FontWeight.normal),*/
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width, // Adjust width as needed
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    // scrollDirection: Axis.vertical, // Scroll vertically
                    itemCount: products.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Container(
                        width: 150, // Adjust width as needed
                        height: 180, // Adjust height to accommodate description and icons
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
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
                            color: selectedIndex == index ? TankLineColor.primary : Colors.white, // Change color when selected
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Stack(
                                children: [
                                  // Product Name on the left
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      product['name']!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: selectedIndex == index ? Colors.white : Colors.black, // Change text color when selected
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),

                                  // Description below the product name
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30.0), // Add padding to place below product name
                                      child: Text(
                                        "Description of ${product['name']} goes here.",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: selectedIndex == index ? Colors.white70 : Colors.black87, // Lighter text for description
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Delete icon on the top right
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Show confirmation dialog
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Are you sure?"),
                                              content: Text("Do you want to delete this item?"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    // Handle "No" action (dismiss dialog)
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("No"),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: Colors.white, backgroundColor: Colors.red, // Set text color to white
                                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Add padding for a bigger button
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8), // Add rounded corners
                                                    ),
                                                  ),),
                                                TextButton(
                                                  onPressed: () {
                                                    // Handle "Yes" action (perform delete)
                                                    // Perform your delete operation here

                                                    Navigator.of(context).pop(); // Close the dialog after delete action
                                                  },
                                                  child: Text("Yes"),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor, // Set text color to white
                                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Add padding for a bigger button
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8), // Add rounded corners
                                                    ),),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        // Handle delete action
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: selectedIndex == index ? Colors.white : Colors.black, // Icon color based on selection
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Handle the tap action (optional if you want to react to the tap, otherwise use Switch's onChanged)
                                      },
                                      child: Switch(
                                        value: switchValue,  // This is a boolean variable to control the state of the switch
                                        onChanged: (bool newValue) {
                                          // Handle switch value change
                                          setState(() {
                                            switchValue = newValue;  // Update the state when the switch is toggled
                                          });
                                        },
                                        activeColor: TankLineColor.primary,  // Color when the switch is on
                                        inactiveThumbColor: Colors.red,  // Color when the switch is off
                                        inactiveTrackColor: Colors.grey,// TankLineColor.secondary// // Track color when the switch is off
                                      ),
                                    ),
                                  ),
                                  // Edit icon on the bottom right
                                 /* Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Handle edit action
                                      },
                                      child: Text(
                                        "Status",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: selectedIndex == index ? Colors.white : Colors.black, // Change text color when selected
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
