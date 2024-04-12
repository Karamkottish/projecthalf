import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool offers = false;
  bool news = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color of the Scaffold
      appBar: AppBar(
        title: const Text('Join Us', textAlign: TextAlign.left),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView to make the content scrollable
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                  labelStyle: TextStyle(color: Colors.white), // Set text color to white
                  enabledBorder: UnderlineInputBorder( // Set underline color to grey
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                style: TextStyle(color: Colors.white), // Set input text color to white
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter your password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              buildSwitchListTile('Sign up for exclusive offers', offers, (bool value) {
                setState(() {
                  offers = value;
                });
              }),
              buildSwitchListTile('I accept the Terms and conditions', news, (bool value) {
                setState(() {
                  news = value;
                });
              }),
              const SizedBox(height: 20),
              Center( // Center the button
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Set the background color to dark blue
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Add padding
                  ),
                  onPressed: () {
                    // Handle button press
                  },
                  child: const Text(
                    'Join Us',
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
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

  Widget buildSwitchListTile(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue, // Optional: Set the active color of the switch
        ),
      ],
    );
  }
}
