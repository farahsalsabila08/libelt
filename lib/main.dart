import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libelt/app/routes/app_pages.dart';
import 'package:libelt/app/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Libel Tech',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
