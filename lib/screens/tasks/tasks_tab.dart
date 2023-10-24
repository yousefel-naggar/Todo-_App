import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/shared/firebase/firebase_functions.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20.w,
          monthColor: Theme.of(context).colorScheme.primary,
          dayColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
          activeDayColor: Theme.of(context).colorScheme.secondary,
          activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
          dotsColor: Theme.of(context).colorScheme.secondary,
          selectableDayPredicate: (date) => true,
          locale: 'en',
        ),
        FutureBuilder(
          future: FirebaseFunctions.getTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Somthing went wrong");
            }
            List<TaskModel> tasks =
                snapshot.data!.docs.map((e) => e.data()).toList()??[];
            return Expanded(
              child: ListView.builder(itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(taskModel: tasks[index]);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
