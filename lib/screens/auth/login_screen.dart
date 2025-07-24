import 'package:flutter/material.dart';
import '../auth/register.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    // TODO: Implement login logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6DBFC),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6422F4),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Login to continue",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xFF6422F4),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SignUpScreen()),
                    );
                },
                child: Text(
                  "Don’t have an account? Sign Up",
                  style: TextStyle(color: Color(0xFF6422F4)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






































// import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import '../chat/chat_screen.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   // final auth = FirebaseAuth.instance;

//   void loginUser() async {
//   //   try {
  //     await auth.signInWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim());
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (_) => ChatScreen()));
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Login failed: $e"),
  //     ));
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Login")),
  //     body: Padding(
  //       padding: const EdgeInsets.all(24.0),
  //       child: Column(
  //         children: [
  //           TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
  //           TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
  //           SizedBox(height: 20),
  //           ElevatedButton(onPressed: loginUser, child: Text("Login")),
  //         ],
  //       ),
//       ),
//     );
//   }
// }
