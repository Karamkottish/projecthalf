import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/boarding_controller.dart';
import 'view/SearchScreen/SearchScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BoardingController controller = Get.put(BoardingController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        body: Obx(
              () => Stack(
            children: [
              // Background Image
              IndexedStack(
                index: controller.currentPage.value,
                children: [
                  buildPage('lib/assets/images/first.jpg', 'Join Us in Making a Difference', 'Connect With NGOs and Voleenteers who are passonate  about making a difference '),
                  buildPage('lib/assets/images/friends.jpg', 'Be The Change you Want to See', 'Your actions can inspire others'),
                  buildPage('lib/assets/images/hands.jpg', 'Empower Volunteers to Make a Difference', 'Together, we can achieve more'),
                  buildPage('lib/assets/images/phone.jpg', 'Get Updates on Your Project', 'Stay informed about our progress'),
                ],
              ),


              // Navigation Icons on top
              Positioned(
                top: 40, // Adjust the position as needed
                right: 100,
                child: Row(
                  children: List.generate(4, (index) => buildIcon(index)),
                ),
              ),
              // Next Button at the bottom
              Positioned(
                bottom: 40,
                //right: 150,
                left: 100,
                child: GestureDetector(
                  onTap: () {
                    // Increment page index or loop back to start
                    int nextPage = controller.currentPage.value + 1;
                    if (nextPage >= 4) {
                      nextPage = 0; // Loop back to the first page
                    }
                    controller.changePage(nextPage);
                  },
                  child: Opacity(
                    opacity: 0.3, // Adjust transparency as needed
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black, // Adjust color as needed
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(String imagePath, String boldText, String normalText) { // Notice the additional 'normalText' parameter
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center( // Centers the column widget in the Stack
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Use minimal space
            children: [
              Text(
                boldText,
                style: TextStyle(
                  fontSize: 45, // Adjust the size as you see fit
                  fontWeight: FontWeight.bold, // Keeps the text bold
                  color: Colors.white, // Sets the text color to white for contrast
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8), // Provides some spacing between the texts
              Text(
                normalText,
                style: TextStyle(
                  fontSize: 25, // Adjust the size as you see fit
                  fontWeight: FontWeight.normal, // Normal font weight
                  color: Colors.white, // Sets the text color to white for contrast
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }



  Widget buildIcon(int index) {
    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Opacity(
          opacity: 0.5, // Adjust transparency as needed
          child: Icon(
            Icons.circle, // Change this to your desired icon
            size: 24, // Adjust size as needed
            color: Colors.white, // Adjust color as needed
          ),
        ),
      ),
    );
  }
}
