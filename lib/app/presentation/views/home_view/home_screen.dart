import 'package:bike_app/app/logic/authentication_bloc/authentication_bloc.dart';
import 'package:bike_app/app/pin_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bike_app/app/data/repositories/station_repository.dart'
    as locations;

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION =
    LatLng(54.913042, 9.778962); //TODO load phones current location



class HomeScreen extends StatefulWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, Marker> _markers = {};

  double pinPillPosition = -180;
  PinInformation currentlySelectedPin = PinInformation(
      id: '',
      address: '',
      imagePath: '',
      availableSpots: null,
      labelColor: Colors.grey);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final stationLocations = await locations.getBikeStations();
    setState(() {
      _markers.clear();
      for (final station in stationLocations.stations) {
        final marker = Marker(
            markerId: MarkerId(station.id),
            position: LatLng(station.lat, station.lng),
            onTap: () {
              setState(() {
                currentlySelectedPin = PinInformation(
                    id: (station.id),
                    address: (station.address),
                    imagePath: (station.img),
                    availableSpots: 3,
                    labelColor: Colors.blueAccent);
                pinPillPosition = 0;
              });
            });
        _markers[station.address] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: SOURCE_LOCATION);

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
              },
            )
          ],
        ),
        body: Stack(children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            markers: _markers.values.toSet(),
            mapType: MapType.normal,
            initialCameraPosition: initialLocation,
            onMapCreated: _onMapCreated,
            onTap: (LatLng location) {
              setState(() {
                pinPillPosition = -180;
              });
            },
          ),
          AnimatedPositioned(
              bottom: pinPillPosition,
              right: 0,
              left: 0,
              duration: Duration(milliseconds: 200),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: new GestureDetector(
                      onTap: () {
                        print('${currentlySelectedPin.id.toString()}'); // For testing purposes.
                      },
                      child: Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 60),
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    blurRadius: 20,
                                    offset: Offset.zero,
                                    color: Colors.grey.withOpacity(0.5))
                              ]),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    width: 80,
                                    height: 80,
                                    child: Image.network(
                                        currentlySelectedPin.imagePath,
                                        fit: BoxFit.cover)),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                              '${currentlySelectedPin.address.toString()}',
                                              style: TextStyle(
                                                  color: currentlySelectedPin
                                                      .labelColor)),
                                          Text(
                                              'Available spots: ${currentlySelectedPin.availableSpots.toString()}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey))
                                        ]),
                                  ),
                                ),
                              ]) //
                          ))))
        ]));
  }
}
