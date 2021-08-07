import 'package:flutter/material.dart';

class Helpers {
  static showYesNoDialog(
      BuildContext context, String title, String content, Function() onYes) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: onYes,
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
        ],
      ),
    );
  }
}
