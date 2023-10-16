import 'package:compass/core/routes/app_pages.dart';
import 'package:compass/features/feature_compass/presentation/binding/binding.dart';
import 'package:compass/features/feature_compass/presentation/screen/compass_screen.dart';
import 'package:get/get.dart';

List<GetPage> compassRoutes = [
  GetPage(
    name: AppRoutes.RouteCompass,
    page: () => CompassScreen(),
    binding: CompassBinding(),
  ),
];