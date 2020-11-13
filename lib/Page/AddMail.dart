import 'package:flutter/material.dart';

class AddMail extends StatefulWidget {
  @override
  _AddMailState createState() => _AddMailState();
}

class _AddMailState extends State<AddMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Surat"),
      ),
    );
  }
}
