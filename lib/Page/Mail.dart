import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:example_testpage/model/modelresponse.dart';
import 'package:http/http.dart' as http;

class Mail extends StatefulWidget {
  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  List<modelresponse> _modelresponse = List<modelresponse>();

  Future<List<modelresponse>> fetchData() async {
    final response =
    await http.get("https://jsonplaceholder.typicode.com/users");

    var datas = List<modelresponse>();

    if (response.statusCode == 200) {
      var datasJson = json.decode(response.body);
      for (var datasJson in datasJson) {
        datas.add(modelresponse.fromJson(datasJson));
      }
      setState(() {

      });
    }
    return datas;
  }
  bool _load = true;
  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator =_load? new Container(
      color: Colors.grey[300],
      width: 70.0,
      height: 70.0,
      child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
    ):new Container();

    fetchData().then((value) {
      _modelresponse.addAll(value);
    });


    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mail())),
        ),
        title: Text(
            "Mail List"
        ),
      ),

      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
          );
        },
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, bottom: 32, left: 16.0, right: 16.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _modelresponse[index].name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Username: " + _modelresponse[index].username,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Text(
                    "Email: " + _modelresponse[index].email,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Text(
                    "Phone: " + _modelresponse[index].phone,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Text(
                    "Website: " + _modelresponse[index].website,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal
                    ),
                  ),

                  Text(
                    "Detail Alamat",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    "Street: " + _modelresponse[index].address.suite + ", " +
                        _modelresponse[index].address.street + ", " +
                        _modelresponse[index].address.city + "\n Zip Code: " +
                        _modelresponse[index].address.zipcode,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Text(
                    "Detail Company",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    "Name Company: " + _modelresponse[index].company.name,

                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal
                    ),
                  ),

                  Text(
                    "Catchphrase: " + _modelresponse[index].company.catchPhrase,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Text(
                    "BS: " + _modelresponse[index].company.bs,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _modelresponse.length,
      ),
    );

  }
}
