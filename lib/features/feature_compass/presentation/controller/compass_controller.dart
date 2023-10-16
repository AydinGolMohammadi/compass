import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

class CompassController extends GetxController {
  RxBool hasPermissions = false.obs;
  RxDouble direction = 0.0.obs;
  RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;
  RxString side = ''.obs;

  @override
  void onInit() {
    checkGps();

    // set direction
    magnetometerEvents.listen((MagnetometerEvent event) {
      double direct = ((math.atan2(event.x, event.y) * 180 / math.pi) * -1);
      if (direct > 0.0) {
        direction.value = direct;
      } else if (direct < 0.0) {
        direction.value = direct + 360.0;
      } else {
        direction.value = direct;
      }

      if (direction.value.round() <= 25 ||
          direction.value.round() >= 340) {
        side.value = 'N';
      }
      if (direction.value.round() >= 26 &&
          direction.value.round() <= 70) {
        side.value = 'NE';
      }
      if (direction.value.round() >= 71 &&
          direction.value.round() <= 114) {
        side.value = 'E';
      }
      if (direction.value.round() >= 115 &&
          direction.value.round() <= 160) {
        side.value = 'SE';
      }
      if (direction.value.round() >= 161 &&
          direction.value.round() <= 203) {
        side.value = 'S';
      }
      if (direction.value.round() >= 204 &&
          direction.value.round() <= 246) {
        side.value = 'SW';
      }
      if (direction.value.round() >= 247 &&
          direction.value.round() <= 292) {
        side.value = 'W';
      }
      if (direction.value.round() >= 293 &&
          direction.value.round() <= 339) {
        side.value = 'W';
      }
    });

    super.onInit();
  }

  Future<void> checkGps() async {
    hasPermissions.value = false;
    final status = await Geolocator.checkPermission();
    if (status == LocationPermission.denied) {
      Get.defaultDialog(
        backgroundColor: Colors.grey.shade800,
        title: 'Location services',
        middleText:
            'Compass needs to access your location to display your current coodinates.',
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Later',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Phutu',
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              hasPermissions.value = false;
              await Geolocator.requestPermission();
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Allow',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Phutu',
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else if (status == LocationPermission.deniedForever) {
      Get.defaultDialog(
        backgroundColor: Colors.grey.shade800,
        title: 'Location services',
        middleText:
            'Compass needs to access your location to display your current coodinates.',
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Later',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Phutu',
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              hasPermissions.value = false;
              await Geolocator.requestPermission();
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Allow',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Phutu',
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else if (status == LocationPermission.always || status == LocationPermission.whileInUse){
      final position = await Geolocator.getCurrentPosition();
      lat = position.latitude.obs;
      lng = position.longitude.obs;
      if (kDebugMode) {
        print(lat);
        print(lng);
      }
      hasPermissions.value = true;
    }

  }
}
