import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MainProjectPage(),
  ));
}

class MainProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Current Projects'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Details'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailedProjectPage()),
            );
          },
        ),
      ),
    );
  }
}

class DetailedProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detailed Project Overview"),
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