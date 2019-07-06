import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Provide Feedback',
    home: MainFeedback(),
  ));
}

class MainFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Go to Helix'),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Email us'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Call us'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About the App'),
          ),
        ],
      ),
    );
  }
}