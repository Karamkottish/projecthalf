import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/login_screen.dart';
import '../view/registration_screen.dart';

class ConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min, // Use minimal size
        children: [
          Image.asset('lib/assets/images/cartoon.jpg'), // Replace with your image asset
          SizedBox(height: 20), // Space between the image and the first button
          ElevatedButton(
            onPressed: () {
              // Show the register as dialog
              _showRegisterAsDialog(context);
            },
            child: Text('Register Now'),
          ),
          SizedBox(height: 10), // Space between the two buttons
          ElevatedButton(
            onPressed: () => Get.to(() => LoginScreen()),
            child: Text('Log In'),
          ),
        ],
      ),
    );
  }

  void _showRegisterAsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register As'),
          content: Text('Do you want to register as a Volunteer or as a Company?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                // Navigate to the RegistrationScreen for Volunteer
                // Optionally, pass an argument if the RegistrationScreen needs to know the choice
                Get.to(() => RegistrationScreen(), arguments: {'role': 'Volunteer'});
              },
              child: Text('Volunteer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                // Navigate to the RegistrationScreen for Company
                // Optionally, pass an argument if the RegistrationScreen needs to know the choice
                Get.to(() => RegistrationScreen(), arguments: {'role': 'Company'});
              },
              child: Text('Company'),
            ),
          ],
        );
      },
    );
  }
}
