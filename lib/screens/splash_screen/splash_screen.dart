import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/screens/splash_screen/view_models/get_all_data.dart';
import '../../constants/constant_files.dart';
import '../login_screen/login_screen.dart';
import '../main_screen/main_screen.dart';

///splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogined = false;

  @override
  void initState() {
    super.initState();
    getData();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isLogined) {
          Get.off(() => const MainScreen());
        } else {
          Get.off(() => LoginScreen());
        }
      },
    );
  }

  getData() async {
    isLogined = await getAlldata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        ///logo
        child: SvgPicture.asset(
          ConstantFiles().logo_primary,
          width: 70.w,
        ),
      ),
    );
  }
}
