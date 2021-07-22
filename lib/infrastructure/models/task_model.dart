class TaskModel {
  int id;
  String title;
  String content;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.content,
    required this.isCompleted,
  });
  static List<TaskModel> modelList = [
    TaskModel(
      id: 1,
      title: "Alma",
      content: "Jun 05 2021 * Low",
      isCompleted: false,
    ),
    TaskModel(
      id: 2,
      title: "Armud",
      content: "Jun 05 2021 * Low",
      isCompleted: false,
    ),
  ];
}
