import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

///root
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///initialize screen util
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: ((context, child) =>

          ///initialize GetX
          const GetMaterialApp(
            debugShowCheckedModeBanner: false,

            ///first screen (Splash)
            home: SplashScreen(),
          )),
    );
  }
}
