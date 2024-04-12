import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter
import 'package:get/get.dart';
import 'dashboard_screen.dart'; // Import DashboardScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://img.freepik.com/premium-vector/network-connection-background-abstract-style_23-2148875738.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5, // Increased height to accommodate new elements
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                              Text('Remember me', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle "Forgot Password" tap
                            },
                            child: Text('Forgot Password?', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => DashboardScreen(username: 'karam')); // Navigate to DashboardScreen
                        },
                        child: Text('Log In'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
