import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = ['Hello'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddTasks(
                addTaskCallback: (newText) {
                  setState(() {
                    list.add(newText);
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      }),
      body: Container(
        child: ListView(
          children: [
            for (int i = 0; i < list.length; i++)
              Text(
                list[i],
              ),
          ],
        ),
      ),
    );
  }
}

class AddTasks extends StatelessWidget {
  final Function addTaskCallback;
  AddTasks({this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    String newText;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                newText = value;
              },
            ),
            FlatButton(
              onPressed: addTaskCallback,
              //     () {
              //   print(newText);
              // },
              child: Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
