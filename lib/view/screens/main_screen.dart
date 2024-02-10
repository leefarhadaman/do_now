import 'package:do_now/model/task_model.dart';
import 'package:do_now/model/taskdata_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            SizedBox(
              height: 10,
            ),
            buildMyTasks(context),
            SizedBox(
              height: 10,
            ),
            buildTaskList(context)
          ],
        ),
      ),
    );
  }
}

Widget buildAvatarAndUserInfo(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
    borderRadius:
        BorderRadius.circular(MediaQuery.of(context).size.width * 0.075),
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
        Text(
          "Farhad",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Welcome Back",
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
      ],
    ),
  );
}

Widget buildMyTasks(BuildContext context) {
  // Dummy task data for demonstration
  List<Task> tasks = [
    Task(
        buttonText: "1 week left",
        text: "User Interface Design",
        rangeCounter: 3),
    Task(
        buttonText: "2 week left",
        text: "Flutter Integration",
        rangeCounter: 5),
    Task(buttonText: "3 week left", text: "Machine Learning", rangeCounter: 2),
  ];

  return Container(
    width: double.infinity,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tasks.map((task) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 220,
              width: 180, // Adjust the width as needed
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  // border: Border.all(width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () => {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.grey), // Border color
                            ),
                            child: Text(
                              task.buttonText,
                              style: TextStyle(
                                  color: Colors.blueGrey, fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 120,
                      child: Text(
                        task.text,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.2),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );
}


Widget buildTaskList(BuildContext context) {
  List<TaskData> tasks = [
    TaskData(title: "WebCam capturing coundown", description: "College work"),
    TaskData(title: "GMap to located employee", description: "Company Task"),
    TaskData(title: "Predict AI", description: "College Project"),
    TaskData(title: "WebCam capturing coundown", description: "College work"),
    TaskData(title: "GMap to located employee", description: "Company Task"),
    TaskData(title: "Predict AI", description: "College Project"),
  ];

  double screenHeight = MediaQuery.of(context).size.height;
  double containerHeight = screenHeight * 0.37; // Set container height to 30% of screen height

  return Container(
    height: containerHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20)
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: tasks.map((task) {
            return Container(
              height: 70,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FaIcon(FontAwesomeIcons.file),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                task.title,
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: 15,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                task.description,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.ellipsisVertical),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ),
  );
}

