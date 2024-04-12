import 'package:flutter/material.dart';

class LandCleaningDetailsScreen extends StatelessWidget {
  final String title;
  final String city;

  LandCleaningDetailsScreen({required this.title, required this.city});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView( // Ensure the content fits on smaller devices
        child: Column(
          children: [
            Image.network(
              'https://www.shutterstock.com/image-vector/vector-cartoon-style-illustration-cleaning-600nw-763252405.jpg',
              height: screenHeight * 0.5,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0), // Space below the title
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0), // Space below the city name
                    child: Text(
                      city,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.blue[200]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0), // Space below the description
                    child: Text(
                      "Join us for a day of land cleaning and environmental stewardship! Help restore and preserve our local natural spaces.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Apply Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(200, 50), // Make this button larger
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child:Icon(Icons.save_alt_outlined),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(120, 50), // 60% size of 'Apply Now' button
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
