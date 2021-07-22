class TaskModel {
  String title;
  String content;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.content,
    required this.isCompleted,
  });
  static List<TaskModel> modelList = [
    TaskModel(
      title: "Alma",
      content: "Jun 05 2021 * Low",
      isCompleted: false,
    ),
    TaskModel(
      title: "Armud",
      content: "Jun 05 2021 * Low",
      isCompleted: false,
    ),
  ];
}
