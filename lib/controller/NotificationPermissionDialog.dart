import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ConfirmationDialog.dart';

class NotificationPermissionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Notification Permission'),
      content: Text('Would you like to send you notifications?'),
      actions: [
        TextButton(
          child: Text('Don\'t Allow'),
          onPressed: () {
            // Handle "Don't Allow" action
            Get.back(); // Close the dialog
          },
        ),
        TextButton(
          child: Text('Allow'),
          onPressed: () {
            // Close the current dialog first
            Get.back();
            // Then show the confirmation dialog
            Get.dialog(ConfirmationDialog());
          },
        ),

      ],
    );
  }
}
