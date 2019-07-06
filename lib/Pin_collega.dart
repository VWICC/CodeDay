import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Project_Insight/main.dart';

void returnList() {
  int id = 1;
  getInformation(); // check size of Database and push that as the var id
}

void getInformation () {
// look for collega with id-xx for lat and lon
  int id = 2;
  do {
    String markerName = "test"; //get Name for [id]
    double lat = 51.977124; //get lat for [id]
    double lon = 5.101344; //get lon for [id]
    initState(markerName, lat, lon);
    print("help");
    id--;
  }
  while(id<=0);
}

void initState(markerName, lat, lon) {
  List<Marker> allMarkers = [];
  allMarkers.add(Marker(
      markerId: MarkerId(markerName),
      draggable: false,
      onTap: () {
        print("Marker Tapped");
      },
      position: LatLng(lat,lon)));
  updateMap(allMarkers);
  print("database update");
}
