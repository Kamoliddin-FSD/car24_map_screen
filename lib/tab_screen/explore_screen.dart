import 'dart:async';
import 'package:car24_map_screen/map_widget/search_bar.dart';
import 'package:car24_map_screen/map_widget/service_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreMain extends StatefulWidget {
  const ExploreMain({super.key});

  @override
  State<ExploreMain> createState() => _ExploreMainState();
}

class _ExploreMainState extends State<ExploreMain> {
  static Position? _position;

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

    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: GoogleMap(
            mapType: MapType.hybrid,
            markers: {
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
            initialCameraPosition: _kGooglePlex,
            onMapCreated: ((GoogleMapController controller) =>
                _controller.complete(controller)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  const Expanded(
                      child: SearchPac(
                          color: Colors.orange, text: 'Search services')),
                  const Gap(10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.line_horizontal_3_decrease,
                            color: Colors.orange)),
                  ),
                ],
              )
            ],
          ),
        ),
        const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Gap(10),
                    ServiceWidget(),
                    Gap(10),
                    ServiceWidget(),
                    Gap(10),
                    ServiceWidget(),
                    Gap(10),
                    ServiceWidget(),
                    Gap(10),
                    ServiceWidget(),
                    Gap(10),
                    ServiceWidget(),
                    Gap(10),
                    ServiceWidget(),
                    Gap(10),
                  ],
                ),
              ),
            )
        )
      ]),
    );
  }
}