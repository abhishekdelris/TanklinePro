import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Custom Widgets/customText.dart';
import '../../color/colors.dart';


class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  DrawerItem({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: CustomText(
          text: text,
    fontSize: 4.0,
    color: TankLineColor.blackColor,
    fontWeight: FontWeight.w400),//Text(text,style: ,),
    onTap: () {
    Navigator.of(context).pop(); // Closes the drawer
    onTap(); // Executes the navigation or action
    },
        ),
        Divider(
          color: Colors.grey,//TankLineColor.primary,
          thickness: 1,
        ),
      ],
    );
  }
}