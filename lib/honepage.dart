import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box appbox;
  final TextEditingController idController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  String name = "abc";
  @override
  void initState() {
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
      body: Column(children: <Widget>[
        Expanded(
          child: Center(
            child: FlatButton(
              onPressed: () {
                print(appbox.get("a"));
                print(appbox.get("b"));
                print(appbox.get("c"));
              },
              child: Text("Show"),
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
        Text(name.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[            
            FlatButton(
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
                            FlatButton(
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
            FlatButton(
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
                            FlatButton(
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
            FlatButton(
              onPressed: (){
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
                            FlatButton(
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
