import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;

  TaskItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 4.5, horizontal: 14),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.r)),
        child: Slidable(
          startActionPane: ActionPane(motion: BehindMotion(), children: [
            SlidableAction(
              onPressed: (context) {},
              label: "Delete",
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.r),
                  bottomLeft: Radius.circular(13.r)),
            ),
            SlidableAction(
              onPressed: (context) {},
              label: "Edit",
              icon: Icons.edit,
              backgroundColor:Theme.of(context).colorScheme.primary,
            ),
          ]),
          child: Padding(
            padding: REdgeInsets.all(12),
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
                    Text(taskModel.taskDetails,
                        style: TextStyle(fontSize: 15.sp)),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Theme.of(context).colorScheme.primary),
                    height: 30.h,
                    width: 50.w,
                    child: Icon(
                      Icons.done,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
