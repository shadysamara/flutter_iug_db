import 'package:flutter/material.dart';
import 'package:iug_local_stotage/db_helper.dart';
import 'package:iug_local_stotage/sp_helper.dart';
import 'package:iug_local_stotage/task_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPrefrences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('write on shared prefrences'),
                  onPressed: () {
                    SpHelper.spHelper
                        .writeSomethingToSharedPrefrences('omar', 8, true);
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('read from shared prefrences'),
                  onPressed: () {
                    Map map = SpHelper.spHelper.getUserDate();
                    print(map);
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('insert in database'),
                  onPressed: () {
                    Task task = Task(taskName: 'study', isComplete: true);
                    DBHelper.dbHelper.insertNewTask(task);
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('select All Tasks'),
                  onPressed: () {
                    DBHelper.dbHelper.selectAllTasks();
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('select one task'),
                  onPressed: () {
                    DBHelper.dbHelper.selectSpecificTask('playing');
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('update task'),
                  onPressed: () {
                    Task task = Task(taskName: 'tv', isComplete: false);
                    DBHelper.dbHelper.updateTask(task);
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('write on shared prefrences'),
                  onPressed: () {
                    Task task = Task(taskName: 'playing', isComplete: true);
                    DBHelper.dbHelper.deleteTask(task);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
