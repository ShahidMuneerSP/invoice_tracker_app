import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../animations/animated_content.dart';
import '../../../theme/theme.dart';

Widget widgetUsername(TextEditingController controller) {
  return AnimatedContent(
    show: true,
    leftToRight: 10.0,
    topToBottom: 0.0,
    time: 1600,
    child: Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        controller: controller,
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter email address';
          }
        },
        // cursorHeight: 20.h,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(
            fontFamily: 'Gordita',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          // contentPadding: EdgeInsets.all(15.r),
          fillColor: Colors.white,
          focusColor: Colors.white,

          hoverColor: Colors.white,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
            child: SvgPicture.asset(
              'assets/icons/Message.svg',
              width: 25.w,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            maxWidth: 55.w,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: AppTheme.primaryColor.withOpacity(0.5),
            ),
          ),
        ),
        style: TextStyle(
          fontFamily: 'Gordita',
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
