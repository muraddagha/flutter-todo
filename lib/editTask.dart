import 'package:flutter/material.dart';
import 'package:todo/infrastructure/models/task_model.dart';
import 'package:todo/main.dart';

class EditTask extends StatefulWidget {
  EditTask({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController textController = new TextEditingController();
  String input = "";
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
                hinText: widget.title,
                textController: textController,
              ),
              SizedBox(
                width: screenWidth / 1.1,
                height: screenHeight / 12,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffF44235),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)))),
                  child: Text(
                    "Update Task",
                    style: TextStyle(
                        fontSize: screenWidth / 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    var item = TaskModel.modelList.firstWhere(
                      (element) => element.title == widget.title,
                    );
                    setState(() {
                      input = textController.text;
                      item.title = input;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
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
              "Update Task",
              style: TextStyle(
                  fontSize: screenWidth / 10, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomInput extends StatelessWidget {
  CustomInput({
    Key? key,
    required this.screenHeight,
    required this.hinText,
    required this.textController,
  }) : super(key: key);

  final double screenHeight;
  final String hinText;
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight / 25),
      child: TextField(
        controller: textController,
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
