import 'package:flutter/material.dart';
import 'package:sembast_demo/db/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: MyAppTheme.instance.darkEnabled,
              onChanged: (enabled) {
                MyAppTheme.instance.change(enabled);
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            heroTag: 'clear',
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            backgroundColor: Colors.redAccent,
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: 'add',
            child: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
