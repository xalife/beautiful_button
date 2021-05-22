import 'package:btn/beautiful_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber.shade800,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BeautifulButton(
                  duration: Duration(milliseconds: 100),
                  size: 80,
                  onPressed: () {
                    print("Diğer sayfaya geçildi!");
                  },
                  child: Text("Diğer Sayfa"),
                  color: Colors.green,
                  shade: Colors.green.shade800,
                ),
                BeautifulButton(
                  duration: Duration(milliseconds: 100),
                  size: 40,
                  onPressed: () {
                    print("Diğer sayfaya geçildi!");
                  },
                  child: Icon(
                    Icons.arrow_back,
                  ),
                  color: Colors.red,
                  shade: Colors.red.shade800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
