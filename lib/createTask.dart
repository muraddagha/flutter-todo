import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  CreateTask({Key? key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    var screenDetail = MediaQuery.of(context);
    final double screenWidth = screenDetail.size.width;
    final double screenHeight = screenDetail.size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight / 8,
              bottom: screenHeight / 10,
              left: screenWidth / 10,
              right: screenWidth / 10),
          child: Column(
            children: [
              AddTaskHeader(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              CustomInput(
                screenHeight: screenHeight,
                hinText: "Task Name",
              ),
              CustomInput(
                screenHeight: screenHeight,
                hinText: "Task Type",
              ),
              InputButton(screenWidth: screenWidth, screenHeight: screenHeight)
            ],
          ),
        ),
      ),
    );
  }
}

class InputButton extends StatelessWidget {
  const InputButton({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth / 1.1,
      height: screenHeight / 12,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffF44235),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(60)))),
        child: Text(
          "Add",
          style: TextStyle(
              fontSize: screenWidth / 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          print("object");
        },
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.screenHeight,
    required this.hinText,
  }) : super(key: key);

  final double screenHeight;
  final String hinText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight / 25),
      child: TextField(
        decoration: InputDecoration(
            // hintText: hinText,
            labelText: hinText,
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xffF44235))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}

class AddTaskHeader extends StatelessWidget {
  const AddTaskHeader(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Color(0xffF44539),
              size: screenWidth / 10,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 25, top: screenHeight / 85, bottom: screenHeight / 25),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Add Task",
              style: TextStyle(
                  fontSize: screenWidth / 10, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
