import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projecthalf/view/redeem_points_page.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String username = "User Name"; // Example username
  final String city = "City Name"; // Example city name

  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkModeEnabled = false; // Initial state of the switch

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine text and icon color based on the background color
    Color textColor = _isDarkModeEnabled ? Colors.white : Colors.black;
    Color iconColor = _isDarkModeEnabled ? Colors.white : Colors.grey;

    return Scaffold(
      backgroundColor: _isDarkModeEnabled ? Colors.black : Colors.white,
      body: Column(
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://img.freepik.com/premium-vector/young-man-face-avater-vector-illustration-design_968209-13.jpg'),
                  radius: 60,
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                    ),
                    Text(
                      widget.city,
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: ListView(
              children: ListTile.divideTiles(
                color: iconColor, // Use the iconColor for the divider color
                tiles: [
                  ListTile(
                    leading: Icon(Icons.person, color: iconColor),
                    title: Text('My Account ', style: TextStyle(color: textColor)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.bookmark, color: iconColor),
                    title: Text('Saved Opportunities', style: TextStyle(color: textColor)),
                    onTap: () {},
                  ),
                  SwitchListTile(
                    title: Text('Light/Dark Mode', style: TextStyle(color: textColor)),
                    value: _isDarkModeEnabled,
                    onChanged: _toggleDarkMode,
                    secondary: Icon(_isDarkModeEnabled ? Icons.dark_mode : Icons.light_mode, color: iconColor),
                  ),
                  ListTile(
                    leading: Icon(Icons.card_giftcard, color: iconColor),
                    title: Text('Redeem Your Points', style: TextStyle(color: textColor)),
                    onTap: () {
                      Get.to(() => RedeemPointsPage()); // Using GetX to navigate
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.logout, color: iconColor),
                    title: Text('Log Out', style: TextStyle(color: textColor)),
                    onTap: () {
                      // Log out logic here (if any, like clearing user data)

                      // Navigate back to LoginScreen and clear all routes
                      Get.offAll(() => LoginScreen());
                    },
                  ),

                ],
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
