import 'package:compass/features/feature_compass/presentation/controller/compass_controller.dart';
import 'package:get/get.dart';

class CompassBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(CompassController());
  }
}
