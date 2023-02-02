import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers ={};
  LatLng myLocation = const LatLng(27.7047139, 85.3295421);
  @override
  void initState() {
    markers.add(
      Marker(
        // add marker on google map
        markerId: MarkerId(myLocation.toString()),
        position: myLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Gopal Dai ko chatamari',
          snippet: 'Chatamari',
        ),
        //Icon for marker
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map in Flutter"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GoogleMap(
        //enable Zoom in and out in Map
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: myLocation, //initial position
          zoom: 10, //initial zoom level
        ),
        markers: markers,//markers to show on map
        mapType: MapType.normal,//map type
        onMapCreated: (controller){
          //method called when map is created
          setState(() {
            mapController= controller;
          });
        },
      ),
    );
  }
}