import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isGranted = false;
  static Position? _position;

  @override
  void initState() {
    _requestPermission();
    super.initState();
  }

  void _requestPermission() async {
    final response = await Permission.location.request();
    _isGranted = response.isGranted;
    if (response.isGranted) {
      print('Permission Granted, you can get location');
      _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } else {
      print('Permission denieb');
      if (await Permission.location.shouldShowRequestRationale) {
        openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)
      ),
      // home: HomePage(),
      home: SplashView(),
    );
  }
}
