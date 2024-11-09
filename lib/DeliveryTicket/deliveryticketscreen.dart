import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Custom Widgets/customText.dart';
import '../color/colors.dart';
import '../constants/constants.dart';

class Deliveryticketscreen extends StatefulWidget {
  const Deliveryticketscreen({super.key});

  @override
  State<Deliveryticketscreen> createState() => _DeliveryticketscreenState();
}

class _DeliveryticketscreenState extends State<Deliveryticketscreen> {
  double h = Constants.screen.height;
  double w = Constants.screen.width;


  List<Map<String, String>> products = [
    {
      'name': 'Product 1',
      'user': 'John Doe',
      'date': '08/11/2024',
      'time': '10:30 AM',
      'truckRate': '50 USD',
      'status': 'Pending'
    },
    {
      'name': 'Product 2',
      'user': 'Jane Smith',
      'date': '08/11/2024',
      'time': '11:00 AM',
      'truckRate': '60 USD',
      'status': 'Completed'
    },
    {
      'name': 'Product 3',
      'user': 'Bob Johnson',
      'date': '08/12/2024',
      'time': '02:30 PM',
      'truckRate': '55 USD',
      'status': 'Pending'
    },
    {
      'name': 'Product 4',
      'user': 'Alice Brown',
      'date': '08/12/2024',
      'time': '04:00 PM',
      'truckRate': '70 USD',
      'status': 'In Progress'
    },
  ];
  int? selectedIndex; // To track the selected index
  bool switchValue = false; // Initial value of the switch

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
                          text: "Payment",
                          fontSize: 5,
                          color: TankLineColor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Add Icon Button on the right side

                    // Invite text button on the right side
                    /*TextButton(
                      onPressed: () {
                        Get.to(Paymentscreensecond());
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
                    ),*/
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
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                      product['name']!,
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(height: 8),
                      Text(
                      'User: ${product['user']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      Text(
                      'Date: ${product['date']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      Text(
                      'Time: ${product['time']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      Text(
                      'Truck Rate: ${product['truckRate']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),

                      ],
                      ),
                      ),),
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
