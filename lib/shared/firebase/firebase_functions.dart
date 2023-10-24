import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static addTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }

   static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    return getTaskCollection()
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }
}
