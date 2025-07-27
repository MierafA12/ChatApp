import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import '../../services/auth_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool isLoading = false;

  void signUpUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        await _authService.signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          fullName: fullNameController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created successfully!')),
        );
        // TODO: Navigate to home or login
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DBFC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF6422F4)),
              ),
              const SizedBox(height: 10),
              const Text("Fill in the details to get started", style: TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 30),

              // Full Name
              buildInput(fullNameController, "Full Name", Icons.person_outline, validator: (val) {
                if (val == null || val.isEmpty) return "Enter your name";
                return null;
              }),
              const SizedBox(height: 16),

              // Phone
              buildInput(phoneController, "Phone", Icons.phone_outlined, keyboardType: TextInputType.phone, validator: (val) {
                if (val == null || val.length < 9) return "Enter a valid phone number";
                return null;
              }),
              const SizedBox(height: 16),

              // Email
              buildInput(emailController, "Email", Icons.email_outlined, keyboardType: TextInputType.emailAddress, validator: (val) {
                if (val == null || !val.contains('@')) return "Enter a valid email";
                return null;
              }),
              const SizedBox(height: 16),

              // Password
              buildInput(passwordController, "Password", Icons.lock_outline, obscure: true, validator: (val) {
                if (val == null || val.length < 6) return "Password too short";
                return null;
              }),
              const SizedBox(height: 16),

              // Confirm Password
              buildInput(confirmPasswordController, "Confirm Password", Icons.lock_reset, obscure: true, validator: (val) {
                if (val != passwordController.text) return "Passwords do not match";
                return null;
              }),
              const SizedBox(height: 24),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : signUpUser,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF6422F4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Sign Up", style: TextStyle(fontSize: 16)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()),
                  );
                },
                child: const Text("Already have an account? Login", style: TextStyle(color: Color(0xFF6422F4))),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(TextEditingController controller, String label, IconData icon,
      {bool obscure = false, TextInputType keyboardType = TextInputType.text, String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}
