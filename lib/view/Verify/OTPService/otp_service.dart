// otp_service.dart
import 'package:firebase_auth/firebase_auth.dart';

class OTPService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> sendOTP(
      String phoneNumber, {
        required PhoneVerificationCompleted verificationCompleted,
        required PhoneVerificationFailed verificationFailed,
        required PhoneCodeSent codeSent,
        required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
      }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      // Handle error
    }
  }
}
