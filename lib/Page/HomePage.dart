import 'dart:convert';

import 'package:example_testpage/Login/Login.dart';
import 'package:example_testpage/Page/AddMail.dart';
import 'package:example_testpage/Page/Mail.dart';
import 'package:example_testpage/Page/MailApprove.dart';
import 'package:example_testpage/Page/MailSending.dart';
import 'package:example_testpage/Page/Setting.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:example_testpage/model/modelresponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentTab = 0;
  final List<Widget> screens = [
    AddMail(),
    Mail(),
    ApproveMail(),
    Setting(),
  ];

  Widget currentScreen = Mail();

  final PageStorageBucket pageBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.mail, title: 'Surat Masuk'),
            TabItem(icon: Icons.outgoing_mail, title: 'Terkirim' ,),
            TabItem(icon: Icons.add, title: 'Buat Surat'),
            TabItem(icon: Icons.approval, title: 'Approved'),
            TabItem(icon: Icons.settings, title: 'Setting'),
          ],
          initialActiveIndex: 0,//optional, default as 0
          onTap: (int i) {
            setState(() {

            });
        },
        )
  /*    body: PageStorage(
        child: currentScreen,
        bucket: pageBucket,
      ),
      //Floating Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            currentScreen = AddMail();
            currentTab = 2;
          });
        },
      ),
      // FAB posisition
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Buttom action bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Mail();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Surat Masuk",
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = MailSending();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Terkirim",
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ApproveMail();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail_outline_rounded,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Approved",
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Setting();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Setting",
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),*/
    );
  }
}
