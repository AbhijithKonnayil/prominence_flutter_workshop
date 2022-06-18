import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyWidget()));
}

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love Calc"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Container(
        width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Your Name'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Your Crush's Name"),
            ),
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Calculate"),
            )
          ],
        ),
      ),
    );
  }
}
