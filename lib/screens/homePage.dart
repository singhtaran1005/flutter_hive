import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../main.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box appbox;
  String title;
  final TextEditingController idController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  String name = "abc";
  @override
  void initState() {
    title = widget.title;
    Hive.openBox('settings').then((value) => appbox = value).whenComplete(() {
      getet();
      print(name);
    });
    super.initState();
  }

  getet() {
    setState(() {
      name = appbox.get("a");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title')),
      drawer: Drawer(
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                Text('Profile',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black45,
                      fontWeight: FontWeight.w100,
                    ));
              },
            ),
          ),
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                print(appbox.get("a"));
                print(appbox.get("b"));
                print(appbox.get("c"));
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NEWSCREEN()),
  );
              },
              child: Text("Show"),
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
        //Text(name.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: idController,
                            ),
                            SizedBox(height: 50),
                            TextFormField(
                              controller: nameController,
                            ),
                            SizedBox(height: 50),
                            RaisedButton(
                              onPressed: () {
                                final key = idController.text;
                                final value = nameController.text;
                                appbox.put(key, value);
                                Navigator.pop(context);
                              },
                              child: Text('Submit'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("Add"),
              color: Colors.greenAccent,
            ),
            RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: idController,
                            ),
                            SizedBox(height: 50),
                            TextFormField(
                              controller: nameController,
                            ),
                            SizedBox(height: 50),
                            RaisedButton(
                              onPressed: () {
                                final key = idController.text;
                                final value = nameController.text;
                                appbox.put(key, value);
                                getet();
                                Navigator.pop(context);
                              },
                              child: Text('Update'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("update"),
              color: Colors.greenAccent,
            ),
            RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: idController,
                            ),
                            SizedBox(height: 50),
                            RaisedButton(
                              onPressed: () {
                                final key = idController.text;
                                appbox.delete(key);
                                Navigator.pop(context);
                              },
                              child: Text('Update'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("delete"),
              color: Colors.greenAccent,
            )
          ],
        )
      ]),
    );
  }
}
