import 'package:flutter/material.dart';

class FoodDetailsPage extends StatelessWidget {
  final List<String> foodItems = [
    "Bread (1 Pack)",
    "Milk (500 ML)",
    "Meat (500 g)",
    "Olive Oil (500 ML)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Food" text at the top left
            Text(
              "Food",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20), // Space between text and grid
            Expanded(
              child: GridView.builder(
                itemCount: foodItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 10.0, // Horizontal space between cards
                  mainAxisSpacing: 10.0, // Vertical space between cards
                  childAspectRatio: 3 / 2, // Adjust based on your content
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white, // Card color
                    child: InkWell(
                      onTap: () {
                        // Implement your onTap functionality here
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('${foodItems[index]} selected'),
                          duration: Duration(seconds: 2),
                        ));
                      },
                      child: Center(
                        child: Text(
                          foodItems[index],
                          style: TextStyle(color: Colors.black, fontSize: 20),
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
