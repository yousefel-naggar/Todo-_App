import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/task_model.dart';

import '../../shared/firebase/firebase_functions.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var tittleController = TextEditingController();

  var detailsController = TextEditingController();

  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add new task",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter task tittle";
                  }
                  return null;
                },
                controller: tittleController,
                decoration: InputDecoration(
                    label: Text(
                      "Task tittle",
                      style: TextStyle(
                          color: Color(0xFFA9A9A9),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.6),
                            width: 1.5.w)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.5.w))),
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter task details";
                  }
                  return null;
                },
                controller: detailsController,
                decoration: InputDecoration(
                    label: Text(
                      "Task details",
                      style: TextStyle(
                          color: Color(0xFFA9A9A9),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.6),
                            width: 1.5.w)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.5.w))),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Select date",
              style: GoogleFonts.poppins(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Text(
                selectedDate.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.75)),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel taskModel = TaskModel(
                        taskTittle: tittleController.text,
                        taskDetails: detailsController.text,
                        date: DateUtils.dateOnly(selectedDate)
                            .millisecondsSinceEpoch);
                    FirebaseFunctions.addTask(taskModel);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Add Task",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  selectDate(context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {});
  }
}
