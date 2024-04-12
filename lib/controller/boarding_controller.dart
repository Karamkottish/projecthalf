import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NotificationPermissionDialog.dart';

class BoardingController extends GetxController {
  var currentPage = 0.obs;
  var promptShown = false.obs;

  void changePage(int index) {
    currentPage.value = index;
    // Check if on the 4th screen and if the prompt has not been shown
    if(index == 3 && !promptShown.value){
      promptShown.value = true; // Prevent prompt from showing again
      Future.delayed(Duration.zero, () { // Wait for UI to build
        if (currentPage.value == 3) { // Assuming the index of the fourth screen is 3
          Get.dialog(NotificationPermissionDialog());
        }
        // Adjust this to your dialog widget
      });
    }
  }
}
