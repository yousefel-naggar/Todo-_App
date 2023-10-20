import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _indexOfBtnNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
