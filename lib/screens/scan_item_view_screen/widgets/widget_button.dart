import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/theme.dart';

Widget widgetButton(GlobalKey<FormState> _formKey) {
  return GestureDetector(
    onTap: () async{
      if (_formKey.currentState!.validate()) {
     
      }
    },
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppTheme.primaryColor,
      ),
      child: Center(
        child: Text(
          'Submit',
          style: TextStyle(
            fontFamily: 'Gordita',
            fontSize: 13.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
