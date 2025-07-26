import 'package:flutter/material.dart';
import '../../services/auth_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final AuthService authService = AuthService();

  void handleSignup() async {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")),
        );
        return;
      }

      final user = await authService.signUp(
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup Successful")),
        );
        Navigator.pop(context); // Navigate to login or chat screen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup Failed")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? "Enter full name" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? "Enter email" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.length < 6 ? "Min 6 characters" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? "Confirm your password" : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: handleSignup,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.lightBlue,
                  ),
                  child: const Text("Sign Up", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
