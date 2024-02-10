import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(
          fontSize: 20,
          fontFamily: 'Comfortaa'
      ),),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF6DB5CA), // Button color
        onPrimary: Colors.white, // Text color
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 100), // Button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Button border radius
        ),
      ),
    );
  }
}