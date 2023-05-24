// ignore_for_file: prefer_collection_literals

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends HookWidget {
  const CustomMap(
      {Key? key,
      required this.position,
      required this.onCameraMove,
      this.disable,
      this.onCameraIdle})
      : super(key: key);

  final Position position;
  final void Function(CameraPosition) onCameraMove;
  final void Function()? onCameraIdle;
  final bool? disable;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final List<Marker> markers = [];

    var map = SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              onCameraIdle: onCameraIdle,
              onCameraMove: onCameraMove,
              gestureRecognizers: Set()
                ..add(Factory<PanGestureRecognizer>(
                    () => PanGestureRecognizer())),
              initialCameraPosition: CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14),
              markers: markers.toSet(),
              onMapCreated: (controller) {
                final marker = Marker(
                  markerId: const MarkerId('0'),
                  position: LatLng(position.latitude, position.longitude),
                );

                markers.add(marker);
              },
            ),
            SizedBox(
              width: 40.w,
              height: 50.h,
              child: Image.asset(
                'images/pin.png',
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return Transform.translate(
                    offset: const Offset(8, -37),
                    child: child,
                  );
                },
              ),
            )
          ],
        ));

    return Material(
      color: Colors.transparent,
      child: map,
    );
  }
}
