import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "HomeLayout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5D9CEC),
        title: Text("TO DO",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary)),

      ),


    );
  }
}
