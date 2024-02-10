import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id; // User ID (optional if using Firestore auto-generated IDs)
  String email;
  String username;
  String phoneNumber;

  User({
    this.id,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  // Convert User object to a map for storing in Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'phoneNumber': phoneNumber,
    };
  }

  // Create a User object from a Firestore document snapshot
  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return User(
      id: snapshot.id,
      email: data['email'] ?? '',
      username: data['username'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }
}
