import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:text_divider/text_divider.dart';

import 'consts.dart';

class GoService extends StatefulWidget {
  const GoService({super.key});

  @override
  State<GoService> createState() => _GoServiceState();
}

class _GoServiceState extends State<GoService> {
  static Position? _position;

  Location _locationController = new Location();
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {

  };

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) => {
      getPolyLinePoints().then((coordinates) => {
        ganeratePolyLineFromPoints(coordinates),
      }),
    },
    );
  }

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  final _marker = LatLng(41.3043587, 69.152774);

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.3043587, 69.152774),
    zoom: 16.0,
  );

  final _service1 = LatLng(41.3056096, 69.1492635);

  @override
  Widget build(BuildContext context) {
    print(_position?.latitude);
    print(_position?.longitude);

    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: _currentP == null
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : GoogleMap(
            mapType: MapType.hybrid,
            markers: {
              Marker(
                  markerId: MarkerId('_currentLocation'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
                  position: _currentP!
              ),
              Marker(
                  markerId: MarkerId('_currentLocation'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
                  position: _marker
              ),
              Marker(
                  markerId: MarkerId('_currentLocation'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
                  position: _service1
              ),
            },
            polylines: Set<Polyline>.of(polylines.values),
            initialCameraPosition: _kGooglePlex,
            onMapCreated: ((GoogleMapController controller) =>
                _controller.complete(controller)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              const Gap(20),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: Colors.white),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.back,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                height: 220,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Where to go from here',style: TextStyle(fontWeight: FontWeight.w700),),
                      ListTile(
                        leading: Icon(CupertinoIcons.location_solid),
                        title: Text('Start'),
                        subtitle: Text('Andijan, Yangi bozor'),
                        trailing: Icon(CupertinoIcons.add),
                      ),
                      TextDivider(text: Text('28.4 km')),
                      ListTile(
                        leading: Icon(CupertinoIcons.location_solid),
                        title: Text('Finish'),
                        subtitle: Text('Andijan, Eski shaxar'),
                        trailing: Icon(CupertinoIcons.xmark),
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
      ]),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _newCameraPosition = CameraPosition(
        target: pos,
        zoom: 16
    );
    await controller.animateCamera(
        CameraUpdate.newCameraPosition(_newCameraPosition)
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.denied) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolyLinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GOOGLE_MAPS_API_KEY,
        PointLatLng(_currentP!.longitude,_currentP!.latitude),
        PointLatLng(_service1.longitude,_service1.latitude),
        travelMode: TravelMode.driving
    );
    if(result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void ganeratePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.orange,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
