import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hive/screens/homePage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class NEWSCREEN extends StatefulWidget {
  @override
  _NEWSCREENState createState() => _NEWSCREENState();
}

class _NEWSCREENState extends State<NEWSCREEN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER HIVE'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Text('data')
          ],
        ),
      ),
    );
  }
}
