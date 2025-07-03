import 'dart:async';

import 'package:flutter_background_service/flutter_background_service.dart';

import 'package:geolocator/geolocator.dart';

Future<void> services() async {
  final FlutterBackgroundService backgroundService = FlutterBackgroundService();
  backgroundService.configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration:
          AndroidConfiguration(onStart: onStart, isForegroundMode: true));
}

void onStart(ServiceInstance ser) async {
  Geolocator.getPositionStream().listen((Position? position) {
    print(position == null
        ? 'Unknown'
        : '${position.latitude.toString()}, ${position.longitude.toString()}');
  });
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    Position position = await Geolocator.getCurrentPosition();
  });
}
