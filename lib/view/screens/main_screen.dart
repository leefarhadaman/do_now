import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildAvatarAndUserInfo(context),
            // Add more content here as needed
          ],
        ),
      ),
    );
  }

  Widget buildAvatarAndUserInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildAvatar(context),
          SizedBox(width: 25),
          buildUserInfo(),
        ],
      ),
    );
  }

  Widget buildAvatar(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.075),
      child: Image.asset(
        "asset/images/avatar.jpg",
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.width * 0.15,
        fit: BoxFit.cover, // Ensure the image fills the circular clip
      ),
    );
  }



  Widget buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Farhad",style: TextStyle(
            fontSize: 25,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.bold,
          ),),
          Text("Welcome Back", style: TextStyle(
            fontSize: 15,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),),
        ],
      ),
    );
  }
}
