import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      print("Hello Called!");
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Sign-in error: ${e.toString()}");
      return null;
    }
  }


  // Register with email and password
  Future<User?> registerAndSaveUserData(String email, String password, String username, String phoneNumber) async {
    try {
      print("registered! ");
      // Register user with email and password
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user ID of the newly created user
      final userId = userCredential.user!.uid;

      // Store additional user data in Firestore
      await _firestore.collection('users').doc(userId).set({
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
        // Add more fields as needed
      });

      return userCredential.user;
    } catch (e) {
      // Handle registration errors
      print("Registration error: $e");
      return null;
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Handle password reset errors
      print("Password reset error: $e");
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // Handle sign-out errors
      print("Sign-out error: $e");
    }
  }

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Verify user credentials against Firestore collection
  Future<bool> verifyCredentials(String email, String password) async {
    try {
      // Query Firestore collection for user with matching email and password
      final querySnapshot = await _firestore
          .collection('users') // Adjust this to your collection name
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      // Check if any documents match the query
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      // Handle errors
      print("Error verifying credentials: $e");
      return false;
    }
  }
}
