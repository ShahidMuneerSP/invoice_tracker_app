// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget widgetAppBar() {
  return Container(
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 1,
        offset: const Offset(0, 5),
        blurRadius: 20.r,
      )
    ]),
    padding: EdgeInsets.only(
      left: 15.w,
      top: 20.h,
      bottom: 20.h,
      right: 20.w,
    ),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'Hi, Suneer CK',
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'Gortita',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
