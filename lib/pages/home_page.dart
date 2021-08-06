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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                MyAppTheme.instance.change(false);
              },
              child: Text('Light')),
          TextButton(
              onPressed: () {
                MyAppTheme.instance.change(true);
              },
              child: Text('Dark')),
        ],
      ),
    );
  }
}
