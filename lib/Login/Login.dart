import 'dart:ui';

import 'package:example_testpage/Page/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Animation/FadeAnimation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';


class Login extends StatefulWidget {
  String email = '';
  String password = '';
  String printt = '';

  Login({Key key, @required this.email, @required this.password})
      : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //untuk memunculkan text input klarasi
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  ProgressDialog progressDialog;
  double percentage = 0.0;

  //untuk validasi false
  bool _validate = false;

  //string value
  String email = '';
  String password = '';

  //untuk memunculkan text input
  void onPressed() {
    if (this.email.trim().length == 0) return;
    if (this.password.trim().length == 0) return;
  }

  //untuk valdasi form text
  @override
  void dispose() {
    etEmail.dispose();
    etPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context,
        type: ProgressDialogType.Normal,

        );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              FadeAnimation(
                1,
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.cover)),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Text(
                        "Selamat datang \nKembali",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'airbnb',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                child: TextFormField(
                                  controller: etEmail,
                                  decoration: InputDecoration(
                                      errorText: _validate
                                          ? "Masukan email anda"
                                          : null,
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: etPassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      errorText: _validate
                                          ? "Masukan password anda"
                                          : null,
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 39,
                    ),
                    FadeAnimation(
                        2,
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(16, 112, 196, 1),
                                Color.fromRGBO(16, 112, 196, .6),
                              ])),
                          child: Center(
                              child: GestureDetector(
                            onTap: () {

                              setState(() {
                                if (etEmail.text.isEmpty
                                    ? _validate = true
                                    : _validate = false) {
                                } else {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
                                  ///progressDialog.show();
                                  email = etEmail.text;
                                  password = etPassword.text;
                                  print("Email : " +
                                      email +
                                      "dan Password : " +
                                      password);
                                }
                              });
                              progressDialog.hide();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontFamily: 'airbnb',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26),
                            ),
                          )),
                        )),
                    SizedBox(
                      height: 70,
                    ),
                    FadeAnimation(
                        1.5,
                        Text(
                          "Forgot Password?",
                          style:
                              TextStyle(color: Color.fromRGBO(16, 112, 196, 1)),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
