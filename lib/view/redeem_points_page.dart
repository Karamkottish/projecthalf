import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'FoodDetailsPage.dart';

class RedeemPointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of card titles
    final List<String> cardTitles = ["Food", "Coupon", "Clothing", "Other"];

    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: Text("Redeem Your Points"),
        backgroundColor: Colors.black, // Optionally, set AppBar background to match
        elevation: 0, // Remove shadow for a flat design
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Redeem Your Points",
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 10.0, // Horizontal space between cards
                  mainAxisSpacing: 10.0, // Vertical space between cards
                ),
                itemCount: cardTitles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (cardTitles[index] == "Food") {
                        Get.to(() => FoodDetailsPage()); // Use GetX to navigate
                      }
                      // Add else if or switch statements here for other cards if needed
                    },
                    child: Card(
                      color: Colors.white, // Dark card color for contrast
                      child: Center(
                        child: Text(
                          cardTitles[index],
                          style: TextStyle(color: Colors.black, fontSize: 24),
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
    );
  }
}
