import 'package:chat_app/screens/chat/onbording_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBLL-mcWa5SX3xUc3yMf0-S-1vo1_LTFPI",
        authDomain: "chatapp-efaea.firebaseapp.com",
        projectId: "chatapp-efaea",
        storageBucket: "chatapp-efaea.firebasestorage.app",
        messagingSenderId: "437452393894",
        appId: "1:437452393894:web:3d42cf383843c093b35367",
        measurementId: "G-ZX1BSVMNN7"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      home: OnboardingScreen(),
    );
  }
}
