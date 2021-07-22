import 'package:flutter/material.dart';
import 'package:todo/createTask.dart';
import 'package:todo/infrastructure/models/task_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;
  List<TaskModel> modelList = TaskModel.modelList;

  @override
  Widget build(BuildContext context) {
    var screenDetail = MediaQuery.of(context);
    final double screenWidth = screenDetail.size.width;
    final double screenHeight = screenDetail.size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight / 8,
                      bottom: screenHeight / 30,
                      left: screenWidth / 10,
                      right: screenWidth / 10),
                  child: HomeHeader(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                ),
              ],
            ),
            modelList.isEmpty
                ? Container(
                    height: screenHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateTask()));
                            },
                            child: Image.asset("assets/img/no_task.png")),
                      ],
                    ),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: modelList.length,
                    itemBuilder: (context, index) {
                      final item = modelList[index];
                      return Dismissible(
                        key: Key(item.title),
                        onDismissed: (direction) {
                          setState(() {
                            modelList.removeAt(index);
                          });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth / 15,
                              ),
                              child: Theme(
                                data: ThemeData(
                                    splashColor: Colors.white.withOpacity(0.3)),
                                child: listItemMethod(modelList, index),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth / 15,
                                  right: screenWidth / 15),
                              child: Divider(),
                            ),
                          ],
                        ),
                        background: Container(
                          color: Colors.red,
                        ),
                      );
                    })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffF44235),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTask(),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  ListTile listItemMethod(List<TaskModel> listItems, int index) {
    return ListTile(
      title: Text(listItems[index].title,
          style: TextStyle(
              decoration: listItems[index].isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none)),
      trailing: Checkbox(
          value: listItems[index].isCompleted,
          activeColor: Color(0xffF54231),
          onChanged: (val) {
            setState(() {
              listItems[index].isCompleted = val!;
            });
          }),
      subtitle: Text(
        "Jun 05,2021 * Low",
        style: TextStyle(
            decoration: listItems[index].isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      onTap: () => setState(
          () => listItems[index].isCompleted = !listItems[index].isCompleted),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight / 100),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "My Tasks",
              style: TextStyle(
                  fontSize: screenWidth / 12, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "2 of 5",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
