import 'package:flutter/material.dart';

class Helper {
  navigationPush(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  navigationPushReplacement(BuildContext context, Widget route) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
