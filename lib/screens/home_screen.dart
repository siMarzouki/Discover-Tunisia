import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../data/app_localizattions.dart';
import '../models/destination.dart';
import 'destination_screen.dart';
import 'about_the_app_screen.dart';

enum OptionsMenu { aboutTheApp }

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CameraPosition _initialLocation =
      const CameraPosition(target: LatLng(33.9949999, 9.6333169), zoom: 6.5);
  late GoogleMapController mapController;

  Set<Marker> markers = {};
  @override
  void didChangeDependencies() {
    final destinations = AppLocalizations.of(context)!.destinations;
    for (Destination x in destinations) {
      markers.add(Marker(
          markerId: MarkerId(x.name),
          position: x.location,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: x.name,
            onTap: () {
              Navigator.of(context)
                  .pushNamed(DestinationScreen.routeName, arguments: x);
            },
          )));
    }
    super.didChangeDependencies();
  }

  _onOptionMenuItemSelected(OptionsMenu item) {
    Navigator.of(context).pushNamed(AboutTheAppScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/images/tunisia.png",
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(AppLocalizations.of(context)!.translate('title')),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<OptionsMenu>(
              child: const Icon(
                Icons.more_vert,
              ),
              onSelected: _onOptionMenuItemSelected,
              itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
                    PopupMenuItem<OptionsMenu>(
                      value: OptionsMenu.aboutTheApp,
                      child: Text(
                          AppLocalizations.of(context)!.translate('about')),
                    ),
                  ])
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ClipOval(
            child: Container(
              color: Colors.black, // inkwell color
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      mapController.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 35,
                      color: Colors.cyan,
                    ),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          ClipOval(
            child: Container(
              color: Colors.black, // inkwell color
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      mapController.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 35,
                      color: Colors.cyan,
                    ),
                  )),
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
      body: SafeArea(
          child: GoogleMap(
        markers: markers,
        initialCameraPosition: _initialLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      )),
    );
  }
}
