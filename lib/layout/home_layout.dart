import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/screens/settings/settings_tab.dart';

import '../screens/tasks/tasks_tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _indexOfBtnNavBar = 0;
  List<Widget>tabs = [TasksTab(),SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("TO DO",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6.sp,
        child: BottomNavigationBar(
          currentIndex: _indexOfBtnNavBar,
          onTap: (value) {
            _indexOfBtnNavBar = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: tabs[_indexOfBtnNavBar],
    );
  }
}
