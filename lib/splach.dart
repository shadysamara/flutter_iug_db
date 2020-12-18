import 'package:flutter/material.dart';
import 'package:iug_local_stotage/db_helper.dart';
import 'package:iug_local_stotage/todoApp.dart';

class SplachPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBHelper.dbHelper.selectAllTasks().then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return TodoApp(value);
      }));
    });
    // TODO: implement build
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
