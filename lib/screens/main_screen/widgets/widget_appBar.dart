import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../qrScanner_screen/qrScannerScreen.dart';

Widget widgetAppBar() {
  return Container(
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 1,
        offset: const Offset(0, 10),
        blurRadius: 20.r,
      )
    ]),
    padding: EdgeInsets.only(
      left: 25.w,
      top: 15.h,
      bottom: 15.h,
      right: 20.w,
    ),
    child: Row(
      children: [
        Text(
          'Hi, Shahid',
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'Gortita',
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        GestureDetector(
            onTap: () {
              Get.to(() => const QrScannerScreen());
            },
            child: SvgPicture.asset('assets/icons/icon_qr_appbar.svg')),
      ],
    ),
  );
}
