import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget widgetTextView({required String title, required String subTitle}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 13.sp,
          fontFamily: "Gordita",
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(
        width: 5.w,
      ),
      Expanded(
        child: Text(
          subTitle,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: "Gordita",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
