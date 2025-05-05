import 'package:get/get.dart';
import 'package:libelt/app/modules/splash/views/splash_view.dart';
import 'package:libelt/app/modules/splash/bindings/splash_binding.dart';
import 'package:libelt/app/modules/home/views/home_view.dart';
import 'package:libelt/app/modules/home/bindings/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
