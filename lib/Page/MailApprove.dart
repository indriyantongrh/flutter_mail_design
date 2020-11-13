import 'package:flutter/material.dart';

class ApproveMail extends StatefulWidget {
  @override
  _ApproveMailState createState() => _ApproveMailState();
}

class _ApproveMailState extends State<ApproveMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mail Approved "),
      ),
    );
  }
}
