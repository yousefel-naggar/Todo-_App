class TaskModel {
  String id;
  String taskTittle;
  String taskDetails;
  int date;
  bool isDone;

  TaskModel(
      {this.id = "",
      required this.taskTittle,
      required this.taskDetails,
      required this.date,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            taskTittle: json['taskTittle'],
            taskDetails: json['taskDetails'],
            date: json['date'],
            isDone: json['isDone']);

  /*TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        taskTittle: json['taskTittle'],
        taskDetails: json['taskDetails'],
        date: json['date'],
        isDone: json['isDone']);
  }*/

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "taskTittle": taskTittle,
      "taskDetails": taskDetails,
      "date": date,
      "isDone": isDone
    };
  }
}
