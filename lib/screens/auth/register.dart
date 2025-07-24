import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signUpUser() {
    // TODO: Implement sign-up logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6DBFC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Text(
              "Create Account",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6422F4),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Fill in the details to get started",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // Full Name
            TextField(
              controller: fullNameController,
              decoration: buildInputDecoration("Full Name", Icons.person_outline),
            ),
            const SizedBox(height: 16),

            // Phone
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: buildInputDecoration("Phone", Icons.phone_outlined),
            ),
            const SizedBox(height: 16),

            // Email
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: buildInputDecoration("Email", Icons.email_outlined),
            ),
            const SizedBox(height: 16),

            // Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: buildInputDecoration("Password", Icons.lock_outline),
            ),
            const SizedBox(height: 16),

            // Confirm Password
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: buildInputDecoration("Confirm Password", Icons.lock_reset),
            ),
            const SizedBox(height: 24),

            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: signUpUser,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFF6422F4),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Sign Up", style: TextStyle(fontSize: 16)),
              ),
            ),
            TextButton(
              onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
              },
              child: Text(
                "Already have an account? Login",
                style: TextStyle(color: Color(0xFF6422F4)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
