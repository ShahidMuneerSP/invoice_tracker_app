  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget widgetContentText({required String title, required String subtitle}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: "Gordita",
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: "Gordita",
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }