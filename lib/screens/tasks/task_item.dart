import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/models/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
  TaskItem({required this.taskModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 4.5, horizontal: 14),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.r)),
        child: Padding(
          padding: REdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12.r)),
                height: 80.h,
                width: 5.w,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.taskTittle,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(taskModel.taskDetails, style: TextStyle(fontSize: 15.sp)),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                    size: 25.sp,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
