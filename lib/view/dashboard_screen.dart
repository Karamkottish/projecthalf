import 'package:flutter/material.dart';
import 'package:projecthalf/view/profile_screen.dart';
import 'SearchScreen/SearchScreen.dart';

class DashboardScreen extends StatefulWidget {
  final String username;

  DashboardScreen({Key? key, required this.username}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // To track the active tab

  // Define a list of colors for the dashboard boxes
  final List<Color> boxColors = [
    Colors.blueAccent, // For "Project finished"
    Colors.black, // For "Hours spent"
    Colors.black, // For "Hours spent"
    Colors.white, // For "Projects"
  ];

  // Custom text for each dashboard
  final List<String> dashboardTexts = [
    'Project finished',
    'Hours spent',
    'Current Projects',
    'Projects',
  ];
  // Custom text for each dashboard box
  final List<String> dashboardTitles = [
    'Land Cleaning',
    'Home Paint',
    'English Teaching',
    'Helping the elderly',
  ];
  // Custom text style for the last dashboard
  final TextStyle lastDashboardTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    decoration: TextDecoration.underline,
    decorationColor: Colors.blue,
    decorationThickness: 3,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Set the background color of the entire screen
      body: Scrollbar( // Wrap with Scrollbar
        thumbVisibility: true, // Show scrollbar thumb
        child: SingleChildScrollView( // Allows for vertical scrolling
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Hello @${widget.username}', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
                SizedBox(height: 20),
                Text('My Effect', style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
                SizedBox(height: 40),
                // Note: Removed Expanded widget here, as it conflicts with SingleChildScrollView
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0, // Horizontal space between items
                  mainAxisSpacing: 10.0, // Vertical space between items
                  childAspectRatio: 2/ 2, // Adjust the size of the boxes
                ),
                itemBuilder: (context, index) {
                  // Assuming indexes 1 and 2 correspond to "Hours spent"
                  bool isHoursSpentDashboard = index == 1 || index == 2;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          color: boxColors[index % boxColors.length],
                          borderRadius: BorderRadius.circular(20),
                          border: isHoursSpentDashboard ? Border.all(color: Colors.white, width:1) : null,
                        ),
                        child: Center(
                          child: Text(
                            dashboardTexts[index],
                            style: index == 3 ? lastDashboardTextStyle : TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      if (index == 2) // Check if this is the "Current Projects" dashboard to add "Open opportunities" text
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            "Open opportunities",
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Like'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        backgroundColor: Colors.black12, // Set the background color to black
        unselectedItemColor: Colors.black, // Optional: Change the color of unselected items if needed
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 2: // Search screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
              break;
            case 3: // Profile screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
          // Handle other indices if necessary
          }
        },
      ),

    );
  }
}