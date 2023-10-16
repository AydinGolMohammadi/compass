import 'package:compass/features/feature_compass/presentation/controller/compass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class CompassScreen extends StatelessWidget {
  final CompassController _controller = Get.find();

  CompassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Compass',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: GetX<CompassController>(
          builder: (context) => _controller.hasPermissions.value
              ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            _controller.side.value,
                            style: const TextStyle(
                              fontFamily: 'Phutu',
                              fontSize: 60.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${(_controller.direction.value).round().toString()}°",
                            style: const TextStyle(
                              fontFamily: 'Phutu',
                              fontSize: 70.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 300,
                              child: Transform.rotate(
                                angle: ((_controller.direction.value) *
                                    (math.pi / 180) *
                                    -1),
                                child: Image.asset(
                                  'assets/images/compass.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'N',
                      style: TextStyle(
                        fontFamily: 'Phutu',
                        fontSize: 60.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "0°",
                      style: TextStyle(
                        fontFamily: 'Phutu',
                        fontSize: 70.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Transform.rotate(
                          angle: 0,
                          child: Image.asset(
                            'assets/images/compass.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 90,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'NL',
                        style: TextStyle(
                          fontFamily: 'Phutu',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "0.0°",
                        style: TextStyle(
                          fontFamily: 'Phutu',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'NL',
                        style: TextStyle(
                          fontFamily: 'Phutu',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        '0.0°',
                        style: TextStyle(
                          fontFamily: 'Phutu',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
