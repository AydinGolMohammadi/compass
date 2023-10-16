import 'package:compass/features/feature_compass/presentation/routes/compass_routes.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static String get initialRoute{
    return AppRoutes.RouteCompass;
  }

  static List<GetPage> get pages => [
    ...compassRoutes,
  ];
}