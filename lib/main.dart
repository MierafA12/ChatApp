import 'package:chat_app/screens/chat/chat_list_screen.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'screens/chat/onbording_screen.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      // home: OnboardingScreen(),
      home:ChatListScreen()
    );
  }
}
