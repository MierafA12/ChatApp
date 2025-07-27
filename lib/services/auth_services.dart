import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // SIGN UP
  Future<User?> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;

      // Save user to Firestore
      await _db.collection("users").doc(uid).set({
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'phone': '', // default empty or use actual phone
      });

      return credential.user;
    } catch (e) {
      print("Signup error: $e");
      rethrow;
    }
  }

  // LOGIN
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Login error: $e");
      rethrow;
    }
  }

  // CURRENT USER
  User? get currentUser => _auth.currentUser;
}
