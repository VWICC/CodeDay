import 'dart:async';

import 'package:Project_Insight/fab_bottom_app_bar.dart';
import 'package:Project_Insight/fab_with_icons.dart';
import 'package:Project_Insight/layout.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

Map<int, Color> color =
{
  50:Color.fromRGBO(102,147,188, .1),
  100:Color.fromRGBO(102,147,188, .2),
  200:Color.fromRGBO(102,147,188, .3),
  300:Color.fromRGBO(102,147,188, .4),
  400:Color.fromRGBO(102,147,188, .5),
  500:Color.fromRGBO(102,147,188, .6),
  600:Color.fromRGBO(102,147,188, .7),
  700:Color.fromRGBO(102,147,188, .8),
  800:Color.fromRGBO(102,147,188, .9),
  900:Color.fromRGBO(102,147,188, 1),
}; // Pantone 542

MaterialColor colorCustom = MaterialColor(0xFF6693BC, color);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Project Insight',
      theme: new  ThemeData( primarySwatch: Colors.orange),
      home: new Startpage(title: 'VWICC GWW Heatmap'),
    );
  }
}

class Startpage extends StatefulWidget {
  Startpage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<Startpage> createState() => MapSampleState();
}

class MapSampleState extends State<Startpage> with TickerProviderStateMixin{
  Completer<GoogleMapController> _controller = Completer();
  String _lastSelected = 'TAB: 0';
  static final CameraPosition _cStartPos = CameraPosition(
    target: LatLng(52.190149, 5.438333),
    zoom: 18,
  );

  static final CameraPosition _cNewPos = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(51.977124, 5.101344),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _cStartPos,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'VWICC',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: "Menu"),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Projecten'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: "Collega's"),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Feedback'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
        context),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position:  Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: "increment",
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_cNewPos));
  }
}