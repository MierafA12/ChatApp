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
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    // Save fullName in Firestore or wherever needed
    await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set({
      'fullName': fullName,
      'email': email,
      'uid': credential.user!.uid,
    });

    return credential.user;
  } catch (e) {
    print("Signup error: $e");
    return null;
  }
}


  // LOGIN
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // GET CURRENT USER
  User? get currentUser => _auth.currentUser;
}
