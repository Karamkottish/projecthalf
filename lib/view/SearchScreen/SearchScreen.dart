import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projecthalf/view/land_cleaning_page.dart';

class SearchScreen extends StatelessWidget {
  // Titles for each dashboard box
  final List<String> dashboardTitles = [
    'Land Cleaning',
    'Home Paint',
    'English Teaching',
    'Helping the Elderly',
    'Community Service',
    'Public Awareness',
    'Environmental Care',
    'Cultural Events',
  ];

  // City names for each dashboard box
  final List<String> cityNames = [
    'Damascus',
    'Aleppo',
    'Hama',
    'Daraa',
    'Sweida',
    'Latakia',
    'Tartus',
    'Homs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            fillColor: Colors.white70, // Lighter grey color for the search bar
            filled: true,
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            isDense: true,
          ),
        ),
        backgroundColor: Colors.grey[850], // Dark grey color for the app bar
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Place your filter logic here
            },
          ),
        ],
      ),
      backgroundColor: Colors.black38, // Set the background color for the screen
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: dashboardTitles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 30,
            childAspectRatio: 2 / 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            bool isLandCleaning = dashboardTitles[index] == "Land Cleaning";

            return GestureDetector(
              onTap: () {
                // Navigate to details page, you might want to pass specific details based on the card tapped
                Get.to(() => LandCleaningDetailsScreen(title: dashboardTitles[index], city: cityNames[index]));
              },
              child: Card(
                color: Colors.grey[100],
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: isLandCleaning ? DecorationImage(
                      image: NetworkImage("https://media.istockphoto.com/id/1193475383/nl/vector/mensen-die-een-stadspark-samen-schoonmaken-en-afval-inzamelen.jpg?s=612x612&w=0&k=20&c=JNA6IIVMJ0oBzf6QhNzmBQRebY2I3lgGVEiiRp2FJ84="),
                      fit: BoxFit.cover,
                    ) : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!isLandCleaning) // Show text only if it's not the Land Cleaning card
                          Text(
                            dashboardTitles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        SizedBox(height: 6), // Space between the texts
                        Text(
                          cityNames[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isLandCleaning ? Colors.black : Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),

      ),

    );
  }
}
