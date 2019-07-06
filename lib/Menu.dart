import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Menu',
    home: MainMenu(),
  ));
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Details'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuItem()),
            );
          },
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Variable Item"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Show All'),
        ),
      ),
    );
  }
}