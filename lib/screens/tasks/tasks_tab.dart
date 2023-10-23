import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/screens/tasks/task_item.dart';

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
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return TaskItem();
            },
          ),
        )
      ],
    );
  }
}
