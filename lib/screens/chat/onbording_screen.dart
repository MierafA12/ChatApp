import 'package:flutter/material.dart';
import '../auth/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6422F4), // Full background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image in the center
              Image.asset(
                'assets/images/chat.png',
                height: 250,
              ),
              const SizedBox(height: 30),
              
              // Title text
              const Text(
                "Welcome to ChatApp",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              const Text(
                "Chat instantly. Stay connected.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFE6DBFC),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  LoginScreen()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE6DBFC), // Light button
                    foregroundColor: const Color(0xFF6422F4), // Text color
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
